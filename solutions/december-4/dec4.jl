include("src/Dec4.jl")

@time check_suitable1.(136760:595730) |> sum 
@time check_suitable2.(136760:595730) |> sum 
