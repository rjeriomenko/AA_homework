class Stack
  def initialize
    @stack = []
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

class Queue
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
        @queue
    end

    def peek
        @queue[-1]
    end
end

class Map
    def initialize
        @map = []
    end

    def key_present?(key)
        @map.any? { |tuple| tuple[0] = key }
    end

    def index(key)
        if key_present?(key)
            @map.each_with_index do |tuple, idx|
                return idx if tuple[0] = key
            end
        end
    end

    def set(key, value) # `set` method can be used to create a new key-value pair or update the value for a pre-existing key.
        key_index = index(key)
        if key_index
            tuple = @map[key_index]
            tuple[1] = value  ###does this work or do I need to do @map[key_index][1]?????
        else
            @map << [key, value]
        end
    end

    def get(key)
        key_index = index(key)
        return @map[key_index][0] if key_index
        nil
    end

    def delete(key)
        key_index = index(key)
        tuple = @map[key_index] if key_index

        @map.delete(tuple) if key_index
        nil
    end

    def show
        @map
    end

end