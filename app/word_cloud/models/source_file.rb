# frozen_string_literal: true
module WordCloud
  class SourceFile

    attr_reader :name, :project

    def initialize(name, project)
      @name = name
      @project = project
    end

    def to_s
      name
    end

    def lines
      @lines ||= LineFactory.create_from_blame(blame)
    end

    def process!
      lines
    end

    private
      def blame
        Utils::FS.run_in_path(project_path) do
          Git.blame(name)
        end
      end

      def project_path
        project.path
      end

  end
end
