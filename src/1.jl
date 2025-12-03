include("helpers.jl")

input = read_input("inputs/1/1.txt")

directions = [rotation[1] for rotation in input]
distances = [parse(Int,rotation[2:end]) for rotation in input]

## First Star

dial_value = 50
positions = [dial_value]

for (direction, distance) in zip(directions, distances)
    if direction == 'L'
        push!(positions, mod(positions[end]-distance, 100))
    else 
        push!(positions, mod(positions[end]+distance, 100))
    end
end
positions
count(==(0), positions)

## Second Star
dial_value = 50
positions = [dial_value]

for (direction, distance) in zip(directions, distances)
    if direction == 'L'
        for i in 1:distance
        res = positions[end]-1
            push!(positions, mod(res, 100))
        end
    else 
        for i in 1:distance
        res = positions[end]+1
            push!(positions, mod(res, 100))
        end
    end
    if positions[end] == 0
        ctr += 1
    end
end
positions