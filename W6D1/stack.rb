class Stack
    def initialize(arr = [])
      # create ivar to store stack here!
      @stacks = arr
    end

    def push(el)
      # adds an element to the stack
      @stacks.push(el)
    end

    def pop
      # removes one element from the stack
      @stacks.pop
    end

    def peek
      # returns, but doesn't remove, the top element in the stack
      return @stacks[-1]
    end

    private

    attr_reader :stacks

end