include("helpers.jl")

input = read_input("inputs/4/input.txt")

## Vector of Strings to Matrix of Chars
inp_matrix = reduce(vcat, permutedims.(collect.(input)))


function count_adjacent(M, i, j)
    max_size_i = size(M)[1]
    max_size_j = size(M)[2]
    sum = 0
    if M[i,j] == '.'
        return 10
    end
    for k in i-1:i+1
        for l in j-1:j+1
            if (k > 0 && k <= max_size_i) && (l> 0 && l <= max_size_j) && !(k==i && l==j)
                if M[k,l] == '@'
                    sum +=1
                end
            end
        end
    end
    return sum
end

function remove_rolls!(M)
    adjacent_counts = [count_adjacent(M,i,j) for i in 1:size(M)[1], j in 1:size(M)[2]]
    removed_count = count(<(4), adjacent_counts)
    println("can remove $(removed_count) rolls")
    M = [count_adjacent(M,i,j) < 4 ? '.' : M[i,j] for i in 1:size(M)[1], j in 1:size(M)[2]]
    return M, removed_count
end
M = inp_matrix
removed_sum = 0
while true
    M, count = remove_rolls!(M)
    removed_sum += count
    if count == 0
        break
    end
end
removed_sum
