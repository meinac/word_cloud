# frozen_string_literal: true
require 'date'

module WordCloud
  class LineFactory

    class << self
      def create_from_blame(blame)
        Services::BlameParser.process(blame).map do |line_data|
          author = AuthorFactory.create(line_data[0])
          time = DateTime.parse(line_data[1])
          line_no = line_data[2].to_i
          content = line_data[3]

          Line.new(
            author,
            time,
            line_no,
            content
          )
        end
      end
    end

  end
end
