export Point, Movement, move, move_by_vector, move_by_1, reduce_distance, parse_directions, manhattan_distance

struct Point
    x::Int
    y::Int
end

struct Movement
    plane 
    distance
end

function move(x::Array{Movement,1}, out = [], start = Point(0, 0))
    out = move_by_vector(x[1], start, out)
    if length(x) === 1 return out end
    move(x[2:end], out, out[end])
end

function move_by_vector(y::Movement, x::Point = Point(0, 0), out = [x])
    if y.distance === 0 return out end
    shifted = move_by_1(x, y)
    move_by_vector(
        Movement(y.plane, reduce_distance(y)),
        shifted,
        vcat(out, shifted)
   )
end

function move_by_1(x::Point, y::Movement)
    if y.plane === 'V'
        Point(x.x, x.y + (y.distance > 0 ? 1 : -1))
    else y.plane === 'H'
        Point(x.x + (y.distance > 0 ? 1 : -1), x.y)
    end
end

reduce_distance = function(x::Movement) x.distance > 0 ? x.distance - 1 : x.distance + 1 end

function parse_directions(x) 
    if x[1] == 'U' || x[1] == 'R' 
        Movement(
            x[1] === 'U' ? 'V' : 'H', 
            parse(Int, x[2:end])
           )
    elseif x[1] == 'D' || x[1] == 'L'
        Movement(
            x[1] === 'D' ? 'V' : 'H', 
            -parse(Int, x[2:end])
           )
    end
end

manhattan_distance(x::Point) = x.x + x.y
