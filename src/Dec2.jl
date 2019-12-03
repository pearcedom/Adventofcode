export read_program, init_program, process_block!, get_param, get_addr, opcode2func

function read_program(path)
    readlines(path)[1] |> 
        x->split(x, ",") |>
        x->parse.(Int, x)
end

function init_program(mem, noun, verb)
    mem |>
        x->setindex!(x, noun, 2) |>
        x->setindex!(x, verb, 3)
end

function process_block!(mem, ptr = 1)
    if mem[ptr] == 99 return mem[1] end
    p1, p2 = [get_param(i, mem, ptr) for i in 1:2]
    f = opcode2func(mem[ptr])
    mem[get_addr(3, mem, ptr)] = f(p1, p2)
    process_block!(mem, ptr + 4)
end

get_param(p, mem = mem, ptr = ptr) = mem[get_addr(p, mem, ptr)]
get_addr(p, mem = mem, ptr = ptr) = mem[ptr+p]+1

opcode2func(code) = @match (code) begin
    1 => +
    2 => *
end
