"""

- It is a six-digit number.
- The value is within the range given in your puzzle input.
- Two adjacent digits are the same (like 22 in 122345).
- Going from left to right, the digits never decrease; they only ever
  increase or stay the same (like 111123 or 135679).

136760-595730

"""

export check_suitable1, check_suitable2
import StatsBase

function check_suitable1(x)::Bool
    d = digits(x) |> reverse |> diff
    all(>=(0), d) && any(==(0), d)
end

function check_suitable2(x)::Bool
    n = digits(x) |> reverse 
    d = diff(n)
    r = StatsBase.rle(n)[2]
    any(==(r), 2) && all(>=(d), 0)
end
