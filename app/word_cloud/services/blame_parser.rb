# frozen_string_literal: true
module WordCloud
  module Services
    class BlameParser
      BLAME_REGEX = /^(?:[a-f]|\d)+\s\((.+)(\d{4}-\d{2}-\d{2}\s\d{2}\:\d{2}\:\d{2}\s\+\d{4})\s+(\d+)\)(.*)/

      class << self
        def process(blame)
          blame.scan(BLAME_REGEX)
        rescue ArgumentError
          []
        end
      end

    end
  end
end
