using Adventofcode, Test

@testset "dec1" begin
    # fuel simple
    @test fuel(14) === 2
    @test fuel(1969) === 654
    @test fuel(100756) === 33583

    # fuel recursive
    @test fuel2(14) === 2
    @test fuel2(1969) === 966
    @test fuel2(100756) === 50346
end

@testset "dec2" begin
    @test [1,0,0,0,99] |> process_block! == 2
    @test [2,3,0,3,99] |> process_block! == 2
    @test [2,4,4,5,99,0] |> process_block! == 2
    @test [1,1,1,4,99,5,6,0,99] |> process_block! == 30
end

@testset "dec3" begin
    a = [parse_directions(i) for i in ["R8","U5","L5","D3"]]
    b = [parse_directions(i) for i in ["U7","R6","D4","L4"]]
    @test intersect(move(a), move(b)) .|> manhattan_distance |> minimum === 6
    a = [parse_directions(i) for i in ["R75","D30","R83","U83","L12","D49","R71","U7","L72"]]
    b = [parse_directions(i) for i in ["U62","R66","U55","R34","D71","R55","D58","R83"]]
    #@test intersect(move(a), move(b)) .|> manhattan_distance |> minimum === 159
    a = [parse_directions(i) for i in ["R98","U47","R26","D63","R33","U87","L62","D20","R33","U53","R51"]]
    b = [parse_directions(i) for i in ["U98","R91","D20","R16","D67","R40","U7","R15","U6","R7"]]
    @test intersect(move(a), move(b)) .|> manhattan_distance |> minimum === 135
end

