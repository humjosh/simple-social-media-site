class Topic
    @@instance_count = 0

    attr_reader :id
    attr_reader :score
    attr_accessor :content

    def initialize(content, score = 0)
        @@instance_count += 1
        @id = @@instance_count
        @content = content
        @score = score
    end

    def increase_score
        @score += 1
    end
    
    def decrease_score
        @score -= 1
    end

    def <=> (other)
        self.score <=> other.score
    end
end