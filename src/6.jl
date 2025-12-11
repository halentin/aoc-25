include("helpers.jl")

# First Star
inputs = read_input("inputs/6/input.txt")
inputs = split.(inputs, " ")
inputs = hcat([input[input .!= ""] for input in inputs]...)

total = 0
for i in 1:1000
    nums = [parse(Int, input) for input in inputs[i, 1:end-1]]
    if inputs[i, end] == "*" 
         total += prod(nums)
    else
        total += sum(nums)
    end
end
total


## Second Star
inputs
inputs = read_input_as_matrix("inputs/6/input.txt")
split_idx = [i for (i, item) in enumerate(eachcol(inputs)) if item == [' ',' ',' ',' ',' ']]
split_idx = [0, split_idx..., length(eachcol(inputs))+1]
total = 0
for i in 1:length(split_idx)-1
    submatrix = inputs[:,split_idx[i]+1:split_idx[i+1]-1]
    operation = submatrix[end, 1]
    numbers = parse.(Int,String.(eachcol(submatrix[1:end-1,:])))
    println(numbers)
    if operation == '+'
        total += sum(numbers)
    else
        total += prod(numbers)
    end
end
total
vcat(inputs...)
inputs = split.(inputs, " ")