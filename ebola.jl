using DelimitedFiles
using Dates

wikiEVDraw = DelimitedFiles.readdlm("wikipediaEVDraw.csv",',')

# Convirtiendo un Date String a DataTime format
println(DateTime(wikiEVDraw[1,1], "d u y"))

#Probando FOR LOOPS
for num = 3:7
    println("El número ahora es $num")
end

testvalues = [23, "my name is not a name", '/']

for x in testvalues
    println("The value of x is now $x")
end

# Convirtiendo toda la columna 1 en un DataType
# Capturando todos los datos de la columna 1
# los : significa todos los datos y el 1 de la columna 1
col1 = wikiEVDraw[:, 1]
# Ejecutamos un ciclo for que permita crear para cada dato
# de la columna 1 en un DataType
for i = 1:54
    col1[i] = DateTime(col1[i], "d u y")  # note that this replaces the previous value in col1[i]
end
println(col1)
# Creando data que obtenga el tiempo en días desde el 22 de Marzo del 2014
println(Dates.datetime2rata(col1[1]))
# Función para obtener los días de epidemia desde el 22 de Marzo
dayssincemar22(x) = Dates.datetime2rata(x) - Dates.datetime2rata(col1[54])
epidays = Array{Int64}(undef, 54)
for i = 1:54
    epidays[i] = dayssincemar22(col1[i])
end
# Exportando los datos convertidos
wikiEVDraw[:,1] = epidays
print(epidays)
DelimitedFiles.writedlm("wikiEbolaDateConvertedTwo.csv",wikiEVDraw,',')
