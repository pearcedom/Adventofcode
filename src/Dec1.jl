export fuel, fuel2

fuel(x)::Int = x ÷ 3 - 2
fuel(x::String)::Int = fuel(parse(Int64, x))

function fuel2(x, count = 0)::Int
    x = fuel(x)
    x <= 0 ? count : fuel2(x, count + x)
end

