class Queue

    def initialize(arr = [])
        @queue = arr
    end

    def enqueue(ele)
        @queue.push(ele)
    end

    def dequeue
        @queue.shift
    end

    def peek
        @queue[0]
    end

    private

    attr_reader :underlying_array

end