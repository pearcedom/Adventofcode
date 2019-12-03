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
    @test [1,0,0,0,99] |> process_block! == [2,0,0,0,99]
    @test [2,3,0,3,99] |> process_block! == [2,3,0,6,99]
    @test [2,4,4,5,99,0] |> process_block! == [2,4,4,5,99,9801]
    @test [1,1,1,4,99,5,6,0,99] |> process_block! == [30,1,1,4,2,5,6,0,99]
end


