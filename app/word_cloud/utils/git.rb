# frozen_string_literal: true
module WordCloud
  class Git

    class << self
      def blame(file)
        `git blame #{file}`
      end

      def list_files
        `git ls-files`.split(/\n/)
      end
    end

  end
end
