function read_input(filepath)
    res = String[]
    open(filepath) do f
        for line in readlines(f)
            push!(res, line)
        end
    end
    res
end

function read_input_as_matrix(filepath)
    res = String[]
    open(filepath) do f
        for line in readlines(f)
            push!(res, line)
        end
    end
    reduce(vcat, permutedims.(collect.(res)))
end