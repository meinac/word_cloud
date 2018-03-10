# frozen_string_literal: true
module WordCloud
  class ProjectFactory

    class << self
      def create(name, config_params)
        config = ProjectConfig.new(config_params)
        project = Project.new(name, config)
      end
    end

  end
end
