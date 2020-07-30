using DelimitedFiles
# Charging data
EVDdata= DelimitedFiles.readdlm("wikiEbolaDateConvertedTwo.csv",',')
epidays = EVDdata[:,1]
allcases = EVDdata[:,2]
print(epidays)
print(allcases)

# Using plot, graph Data
using Plots
gr()
#plot(epidays,allcases)
#plot(epidays, allcases, linetype = :scatter, marker = :diamond)

plot(epidays, allcases,# here are the data to be plotted, below are the attributes
    title   = "West African EVD epidemic, total cases",
    xlabel  = "Days since 22 March 2014",
    ylabel  = "Total cases to date (three countries)",
    marker  = (:diamond, 8, "gray"),  # note the use of  parentheses to group the marker attributes into a composite of attributes
    # line    = (:path, :dot, :gray),
    line    = (:scatter, "gray"),   # line attributes likewise put together as one unit by the use of parantheses
    legend  = false,
    grid    = false
)

# A nice thing: this layout permits us add comments to individual parts of  the function call.
# Also, notice that it helps readibility to line up vertically all the assignment "=" signs


savefig("WAfricanEVD_noformatspecified")             # no extension, so plot saves it as .png
savefig("WAfricanEVD.pdf")      # Saved as a pdf
savefig("WAfricanEVD.png")     # Saved png format
