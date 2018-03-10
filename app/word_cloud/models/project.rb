# frozen_string_literal: true
module WordCloud
  class Project

    attr_reader :name, :config

    def initialize(name, config)
      @name = name
      @config = config
    end

    def path
      config.path
    end

    def language
      config.language
    end

    def to_s
      "#{name} (#{language})"
    end

    def source_files
      @source_files ||= SourceFileFactory.create_for(self)
    end

    def process!
      source_files.each(&:process!)
    end

    def is_excluded?(entry)
      config.is_excluded?(entry)
    end

  end
end
