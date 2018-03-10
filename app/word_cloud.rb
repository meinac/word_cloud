# frozen_string_literal: true
require_relative "config.rb"
require_relative "word_cloud/models/author.rb"
require_relative "word_cloud/models/line.rb"
require_relative "word_cloud/models/project.rb"
require_relative "word_cloud/models/source_file.rb"
require_relative "word_cloud/models/project_config.rb"

require_relative "word_cloud/factories/author_factory.rb"
require_relative "word_cloud/factories/project_factory.rb"
require_relative "word_cloud/factories/line_factory.rb"
require_relative "word_cloud/factories/source_file_factory.rb"

require_relative "word_cloud/services/blame_parser.rb"

require_relative "word_cloud/utils/fs.rb"
require_relative "word_cloud/utils/git.rb"

module WordCloud

  ROOT_PATH = File.expand_path('../../', __FILE__)

  def self.run
    Config.apps.each do |project_name, project_conf|
      project = ProjectFactory.create(project_name, project_conf)
    end
  end

end
