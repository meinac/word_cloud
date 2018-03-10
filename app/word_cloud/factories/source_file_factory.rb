# frozen_string_literal: true
module WordCloud
  class SourceFileFactory

    class << self
      def create_for(project)
        files = Utils::FS.run_in_path(project.path) { Git.list_files }

        files.map { |file| SourceFile.new(file, project) }
      end
    end

  end
end
