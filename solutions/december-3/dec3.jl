a_in, b_in = [split(i, ",") for i in readlines("solutions/december-3/aoc-3.txt")]
a = [parse_directions(i) for i in a_in]
b = [parse_directions(i) for i in b_in]
@time a_path = trace(a)
@time b_path = trace(b)
intersections = intersect(a_path, b_path)

manhattan_distance.(intersections) |> minimum

path_min = Inf
@time for i in intersections
    global path_min
    path_sum = [j for j in 1:length(a_path) if i == a_path[j]] + [j for j in 1:length(b_path) if i == b_path[j]]
    if path_sum[1] < path_min
        path_min = path_sum[1]
    end
end
path_min
