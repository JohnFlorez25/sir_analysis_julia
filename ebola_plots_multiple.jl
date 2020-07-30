using DelimitedFiles
# Charging data
EVDdata= DelimitedFiles.readdlm("wikiEbolaDateConvertedTwo.csv",',')
println(EVDdata[end-9:end, :]) # note the use of "end" in the array slicing
#... and that end-9:end is a range with 10 elements
rows, cols = size(EVDdata)  # size() is a very useful function ... look it up with "? size"
for j = 1:cols
    for i = 1:rows  # this order goes does one column at a time
       if !isnumeric(string(EVDdata[i,j])[1])  # remember that "!" is the NOT operator (week 1, lecture 5)
         EVDdata[i,j] = 0
       end
   end
end
println(string.(EVDdata[end-9:end, :]))
# extract the data
epidays = EVDdata[:,1]

# load Plots and plot them
using Plots
pyplot()

EVDcasesbycountry = convert(Array{Int64}, EVDdata[:, [4, 6, 8]])
println(typeof(EVDcasesbycountry))

#plot(epidays, EVDcasesbycountry)
plot!(epidays, EVDcasesbycountry,
marker  = ([:octagon :star7 :square], 9),
label   = ["Guinea" "Liberia" "Sierra Leone"],
title   = "EVD in West Africa, epidemic segregated by country",
xlabel  = "Days since 22 March 2014",
ylabel  = "Number of cases to date",
line = (:scatter)
)
savefig("L5testfig.pdf")
