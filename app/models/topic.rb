class Topic
    @@instance_count = 0

    attr_reader :id
    attr_reader :score
    attr_accessor :content

    def initialize(content)
        @@instance_count += 1
        @id = @@instance_count
        @content = content
    end
end