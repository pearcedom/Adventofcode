include("src/Dec4.jl")

@time Set(i for i in 136760:595730 if check_suitable1(i)) |> length  
@time Set(i for i in 136760:595730 if check_suitable2(i)) |> length  
