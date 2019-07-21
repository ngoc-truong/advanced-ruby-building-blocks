def bubble_sort(array)
    loop do 
        swapped = false
        index = 0

        0.upto(array.length - 2) do 
            if (array[index] > array[index + 1]) 
                array[index], array[index + 1] = array[index + 1], array[index]     # ruby way for swapping (usually with placeholder)

                swapped = true
            end
            index += 1
        end

        break if swapped == false
    end
    array
end


def bubble_sort_by(array)
    loop do 
        swapped = false
        index = 0
        0.upto(array.length - 2) do 
            
            if yield(array[index], array[index + 1]) > 0
                array[index], array[index + 1] = array[index + 1], array[index]     # ruby way for swapping

                swapped = true
            end
            index += 1
        end

        break if swapped == false
    end
    array
end

# Testing

## Sorting descending
puts bubble_sort_by([5, 1, 3]) { |left, right| right - left }.inspect

puts (bubble_sort_by(["hi", "hello", "hey"]) do |left, right| 
    left.length - right.length 
end).inspect




    