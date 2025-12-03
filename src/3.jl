include("helpers.jl")
input = read_input("inputs/3/input.txt")

### first Star

joltage_sum = 0
for bank in input
    bank_int = [parse(Int, battery) for battery in bank]
    first_digit, index = findmax(bank_int[1:end-1])
    second_digit = maximum(bank_int[index+1:end])
    println("$first_digit $second_digit")
    max_joltage = 10*first_digit+second_digit
    joltage_sum += max_joltage
end
joltage_sum


### second Star
num_digits = 12

joltage_sum = 0
for bank in input
    bank_int = [parse(Int, battery) for battery in bank]
    digits = Int[]
    index = 0
    for digit_pos in 1:num_digits
        last_index = index
        digit, index = findmax(bank_int[index+1:end-(num_digits-digit_pos)])
        index = index + last_index
        # println("$digit at $index")
        push!(digits, digit)
    end
    max_joltage = parse(Int,string([string(digit) for digit in digits]...))
    joltage_sum += max_joltage
end
joltage_sum