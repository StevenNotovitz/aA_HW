class LRUCache

    def initialize(max_size)
        @cache = []
        @max_size
    end

    def count
        @cache.count
    end

    def add(ele)
        @cache.delete(ele) if @cache.include?(ele)
        @cache.push(ele)
        @cache.pop if count > @max_size
    end

    def show
        p @cache
    end

end