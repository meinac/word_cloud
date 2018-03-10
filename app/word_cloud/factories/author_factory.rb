# frozen_string_literal: true
module WordCloud
  class AuthorFactory

    class << self
      def create(name)
        normalized_name = normalize_name(name)

        authors[normalized_name]
      end

      private
        def authors
          @authors ||= Hash.new do |hash, key|
            hash[key] = Author.new(key)
          end
        end

        def normalize_name(name)
          name.strip
        end

    end

  end
end
