def sum_to(n)
    return n if n == 1 || n == 0
    return nil if n < 0

    n + sum_to(n - 1)
end

p sum_to(5)  # => returns 15
p sum_to(1)  # => returns 1
p sum_to(9)  # => returns 45
p sum_to(-8)  # => returns nil
p "--------"

def add_numbers(nums_array) #sum of ints in arr
    length = nums_array.length
    start = nums_array[0]

    return nil if length == 0
    return start if length == 1

    start + add_numbers(nums_array[1..])
end

p add_numbers([1,2,3,4]) # => returns 10
p add_numbers([3]) # => returns 3
p add_numbers([-80,34,7]) # => returns -39
p add_numbers([]) # => returns nil
p "--------"

def gamma_fnc(n)
    return nil if n < 1
    return 1 if n == 1

    (n - 1) * gamma(n - 2)
end

p gamma_fnc(0)  # => returns nil
p gamma_fnc(1)  # => returns 1
p gamma_fnc(4)  # => returns 6 aka 3 * 2 * 1
p gamma_fnc(8)  # => returns 5040
p "--------"

def ice_cream_shop(flavors, favorite)
    length = flavors.length
    start = flavors[0]

    return start == favorite if length < 2
    ice_cream_shop([start], favorite) || ice_cream_shop(flavors[1..], favorite)
end

p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')  # => returns false
p ice_cream_shop(['pistachio', 'green tea', 'chocolate', 'mint chip'], 'green tea')  # => returns true
p ice_cream_shop(['cookies n cream', 'blue moon', 'superman', 'honey lavender', 'sea salt caramel'], 'pistachio')  # => returns false
p ice_cream_shop(['moose tracks'], 'moose tracks')  # => returns true
p ice_cream_shop([], 'honey lavender')  # => returns false
p "--------"

def reverse(string)
    length = string.length
    ending = string[-1]

    return string if length < 2
    ending + reverse(string[...-1])
end

p reverse("house") # => "esuoh"
p reverse("dog") # => "god"
p reverse("atom") # => "mota"
p reverse("q") # => "q"
p reverse("id") # => "di"
p reverse("") # => ""
p "--------"
