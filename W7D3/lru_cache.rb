class LRUCache
    def initialize(size)
      @size = size
      @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.count
    end

    def add(el)
      # adds element to cache according to LRU principle
      if self.count < @size && @cache.none?(el)
        @cache << el
      elsif self.count < @size && @cache.include?(el)
        @cache.delete(el)
        @cache << el
      elsif @cache.none?(el)
        @cache.shift
        @cache << el
      elsif @cache.include?(el)
        @cache.delete(el)
        @cache << el
      end
    end

    def show
      # shows the items in the cache, with the LRU item first
      print @cache
    end

    private
    # helper methods go here!
    # def each(&prc)
    #   i = 0
    #   while self.lenght > i
    #     prc.call(self[i])
    #     i += 1
    #   end
    # end

end