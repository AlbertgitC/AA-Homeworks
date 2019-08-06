class Map

    def initialize(arr = [])
        @map_values = arr
    end

    def set(key, value)
        has_key = false
        @map_values.each do |pair|
            if pair[0] == key
                pair[1] = value
                has_key = true
            end
        end

        if !has_key
            @map_values << [key, value]
        end
    end

    def get(key)
        @map_values.each do |pair|
            return pair[1] if pair[0] == key
        end
        nil
    end

    def delete(key)
        value = get(key)
        @map_values.each_with_index do |pair, i|
            @map_values.delete(@map_values[i]) if pair[0] == key
        end
        value
    end

    def show
        @map_values
    end

    private

    attr_reader :map_values
    
end