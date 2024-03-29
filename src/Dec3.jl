export Point, Vec, trace, parse_directions, manhattan_distance

"""
------
|     |
|  -----  
|  |  | |
|  |  | |
| -|--  |
|       |
|       |
--------
"""

struct Point
    x::Int
    y::Int
end

struct Vec
    plane 
    distance
    direction
end

manhattan_distance(x::Point) = abs(x.x) + abs(x.y)

function trace(x::Array{Vec,1}, start::Point = Point(0, 0), out::Array = [])
    out = vcat(out, trace(x[1], start))
    if length(x) === 1 return out end
    trace(x[2:end], out[end], out)
end

function trace(v::Vec, p::Point = Point(0, 0))
    if v.plane === 'V'
        [Point(p.x, i) for i in p.y:v.direction:p.y+v.distance][2:end]
    elseif v.plane === 'H'
        [Point(i, p.y) for i in p.x:v.direction:p.x+v.distance][2:end]
    end
end

function parse_directions(x) 
    if x[1] == 'U' || x[1] == 'R' 
        Vec(x[1] === 'U' ? 'V' : 'H', parse(Int, x[2:end]), 1)
    elseif x[1] == 'D' || x[1] == 'L'
        Vec(x[1] === 'D' ? 'V' : 'H', -parse(Int, x[2:end]), -1)
    end
end

