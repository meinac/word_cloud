# frozen_string_literal: true
module WordCloud
  module Utils
    class FS

      class << self
        def list(path)
          Dir.entries(path)[2..-1]
        end

        def is_file?(path)
          File.file?(path)
        end

        def join(*paths)
          File.join(*paths)
        end

        def run_in_path(path, &block)
          previous_path = Dir.pwd
          Dir.chdir(path)
          block.call
        ensure
          Dir.chdir(previous_path)
        end
      end

    end
  end
end
