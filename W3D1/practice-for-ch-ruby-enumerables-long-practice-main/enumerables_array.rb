# require "byebug"


# Extend the Array class to include a method named `my_each` that takes a block,
# calls the block on every element of the array, and returns the original array.

class Array
    def my_each(&prc)
        i = 0
        while i < self.length
            prc.call(self[i])
            i += 1
        end

        self
    end

    def my_select(&prc)
        array = []

        self.my_each do |ele|
            array << ele if prc.call(ele)  
        end 
        array
    end

    def my_reject(&prc)
        arr = []

        self.my_each do |ele|
            arr << ele if !prc.call(ele)
        end

        arr
    end

    def my_any?(&prc)
        self.my_each do |ele|
            return true if prc.call(ele)
        end

        false
    end

    def my_all?(&prc)
        self.my_each do |ele|
            return false if !prc.call(ele)
        end

        true
    end

    def my_flatten
        return [self] if !self.is_a?(Array)
    end 


    def my_zip(*arrays)

        arr = []

        (0...self.length).each do |idx|
            row = []
            row << self[idx] 
            arrays.each {|array| row << array[idx]}
            arr << row
        end 
        arr 
    end 

    def my_rotate(rotations=1)  #abcd => dabc if -1
        # debugger
        if rotations < 0
            rotations *= -1
            rotations.times do
                ele = self.pop
                self.unshift(ele)
            end
        elsif rotations > 0
            rotations.times do
                ele = self.shift
                self.push(ele)
            end
        end

        self
    end
     
end

a = [ "a", "b", "c", "d" ]    #---DO NOT RUN EACH TEST BACK TO BACK
p a.my_rotate         #=> ["b", "c", "d", "a"]
p a.my_rotate(2)      #=> ["c", "d", "a", "b"]
p a.my_rotate(-3)     #=> ["b", "c", "d", "a"]
p a.my_rotate(15)     #=> ["d", "a", "b", "c"]

