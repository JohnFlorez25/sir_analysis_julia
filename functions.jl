# Definiendo una variable
greeting = "Hello, Julia Word"
# Ejecutando la función println
println(greeting)
# Realizando multiple asignación de valores en una sola línea
a,b,c = cos(0.2),log(10),abs(-1.22)
println("$a $b $c")
# Pedir ayuda sobre alguna palabra reservada ?
# Definiendo una función de forma práctica
myfunc(firstvar) = 20 * firstvar
# Invocando a la función
println(myfunc(3))
# Definiendo una función multilinea
function next_func(a,b,c)
    a * b + c
end

println(next_func(1,1,1))

# Definiendo el tipo de dato que espero recibir
mycos(thet::Float64) = cos(thet)
println(mycos(1.6894948489489489))
