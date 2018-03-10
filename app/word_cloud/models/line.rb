# frozen_string_literal: true
module WordCloud
  class Line

    attr_reader :author, :time, :number, :content

    def initialize(author, time, number, content)
      @author = author
      @time = time
      @number = number
      @content = content
    end

  end
end
