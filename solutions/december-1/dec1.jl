[fuel(i) for i in readlines("aoc-1-1.txt")] |> sum
[fuel2(i) for i in readlines("aoc-1-1.txt")] |> sum

upping_ante = readlines("upping_the_ante_input.txt");

@time upping_ante .|> fuel2 |> sum

running = Threads.Atomic{Int}(0)
@time Threads.@threads for i in upping_ante
    global running
    Threads.atomic_add!(running, fuel2(i))
end
running



