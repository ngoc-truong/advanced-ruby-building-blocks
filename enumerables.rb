module Enumerable
    def my_each
        max = self.length - 1
        for i in 0..max do 
            yield(self[i])
        end
        self
    end

    def my_each_with_index
        max = self.length - 1

        for i in 0..max do 
            yield(self[i], i)
        end
        self
    end

    def my_select
        selected_items = []

        self.my_each do |item|
            if yield(item)
                selected_items << item
            end
        end

        selected_items
    end

    def my_all?
        self.my_each do |item|
            if yield(item) == false
                return false
            end
        end
        return true
    end

    def my_any? 
        self.my_each do |item| 
            if yield(item) 
                return true
            end
        end
        return false 
    end

    def my_none?
        self.my_each do |item|
            if yield(item)
                return false 
            end
        end
        return true
    end

    def my_count(item_inside = self.length)
        counter = 0

        self.my_each do |item|
            if block_given? 
                if yield(item) 
                    counter += 1
                end
            elsif item == item_inside 
                counter += 1
            else 
                return item_inside
            end
        end
        return counter
    end

    # Use a proc as a parameter
    def my_map(&proc)
        new_array = []
        self.my_each do |item|
            new_array << proc.call(item)
        end
        new_array
    end

    # Use a block as a parameter
    def my_map
        new_array = []
        self.my_each do |item|
            new_array << yield(item)
        end
        new_array
    end

    def my_inject(start) 
        result = start

        self.my_each do |item|
            result = yield(result, item)
        end
        result
    end
end