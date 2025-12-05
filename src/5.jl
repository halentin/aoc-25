include("helpers.jl")

input_ids = read_input("inputs/5/input_ids.txt")
input_ranges = read_input("inputs/5/input_ranges.txt")

input_ids = [parse(Int, id) for id in input_ids]
rangeparse(s::String) = parse(Int, split(s, "-")[1]):parse(Int, (split(s, "-")[2]))
input_ranges = [rangeparse(range) for range in input_ranges]

### first Star
counter = 0
for id in input_ids
    if any(in.(id,input_ranges))
        counter += 1
    end
end
counter


### Second Star
# lower = minimum([range.start for range in input_ranges])
# upper = maximum([range.stop for range in input_ranges])
# counter = 0
# using ProgressMeter
# @showprogress for id in lower:upper
#         if any(in.(id,input_ranges))
#         counter += 1
#     end
# end
# counter
sort!(input_ranges, by=range->range.start)

# have to run this until nothing gets removed anymore
i = 1
while i < length(input_ranges)
    if input_ranges[i+1].start <= input_ranges[i].stop
        # Start of next Range falls into current range
        if input_ranges[i+1].stop <= input_ranges[i].stop
            # Next Range is fully contained in current range so we can remove
            deleteat!(input_ranges, i+1)
        else
            # Ranges Overlap so we merge
            input_ranges[i] = input_ranges[i].start:input_ranges[i+1].stop
            deleteat!(input_ranges, i+1)
        end 
    end
    i += 1
end
input_ranges
# this should only be single item ranges now
input_ranges[in.([range.stop for range in input_ranges],[range.start for range in input_ranges])]

counter = 0
for range in input_ranges
    counter += range.stop-range.start + 1
end
counter