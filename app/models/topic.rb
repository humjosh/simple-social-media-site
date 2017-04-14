class Topic
    attr_accessor :id
    attr_reader :score
    attr_accessor :content

    def initialize(content = '', score = 0)
        @content = content
        @score = score
    end

    def increase_score
        @score += 1
    end
    
    def decrease_score
        @score -= 1
    end
end