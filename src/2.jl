include("helpers.jl")
input = read_input("inputs/2/input.txt")[1]
input = split(input, ",")
lowers = [parse(Int, split(range, "-")[1]) for range in input]
uppers = [parse(Int, split(range, "-")[2]) for range in input]

function detect_invalid(number)
    # Gets all Substrings of number
    str = string(number)
    l = length(str)
    for i in 2:l
        for j in 1:l-i+1
            if is_repeat(str[j:j+i-1])
                return true
            end
        end
    end
    return false
end

function is_repeat(str::String)
    # Detects if the given substring is a repeat
    l = length(str)
    if(mod(l, 2)) == 1
        # odd numbers are never repeats
        return false
    end
    if str[1:div(l, 2)] == str[div(l,2)+1:end]
        return true
    end
    return false
end

function detect_invalid_in_range(lower, upper)
    for i in lower:upper
        if is_repeat(string(i))
            println("invalid number: $i")
            return true
        end
    end
    return false
end
function sum_invalid_in_range(lower, upper)
    sum = 0
    for i in lower:upper
        if is_repeat(string(i))
            println("invalid number: $i")
            sum += i
        end
    end
    return sum
end


sum = 0
for (lower, upper) in zip(lowers, uppers)
    sum += sum_invalid_in_range(lower, upper)
end
sum

### Second Star

function get_all_divisors(i)
    divisors = []
    for divisor_candidate in 1:i-1
        if i % divisor_candidate == 0
            push!(divisors, divisor_candidate)
        end
    end
    divisors
end

function check_repeats(str)
    l = length(str)
    divisors = get_all_divisors(l)
    for divisor in divisors
        result = true
        complement = div(l, divisor)
        for i in 1:complement-1
            if str[1:divisor] != str[i*divisor+1:(i+1)*divisor]
                result = false
            end
        end
        if result
            return true
        end
    end
    return false
end

function sum_invalid_in_range(lower, upper)
    sum = 0
    for i in lower:upper
        if check_repeats(string(i))
            println("invalid number: $i")
            sum += i
        end
    end
    return sum
end

sum = 0
for (lower, upper) in zip(lowers, uppers)
    sum += sum_invalid_in_range(lower, upper)
end
sum