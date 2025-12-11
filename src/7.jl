include("helpers.jl")
input = read_input_as_matrix("inputs/7/input.txt")
split_ctr = 0
for i in 2:size(input)[1]
    for j in 1:size(input)[2]
        chr = input[i,j]
        chr_above = input[i-1, j]
        if chr_above == 'S'
            input[i,j] = '|'
        elseif chr_above == '|'
            if chr =='.'
                input[i,j] = '|'
            elseif chr =='^'
                split_ctr += 1
                input[i,j-1] = '|'
                input[i,j+1] = '|'
            end
        end
    end
end
input
split_ctr