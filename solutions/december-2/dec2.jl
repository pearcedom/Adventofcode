    @assert read_program("aoc-2-1.txt") |> 
        x->init_program(x, 12, 2) |> 
        process_block! |> 
        x->getindex(x, 1) === 3716250

    for i in 1:100
        for j in 1:100
            out = read_program("aoc-2-1.txt") |> 
                x->init_program(x, i, j) |> 
                process_block! |> 
                x->getindex(x, 1) 
            if out === 19690720 return i*100 + j end
        end
    end

