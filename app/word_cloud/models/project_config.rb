# frozen_string_literal: true
module WordCloud
  class ProjectConfig

    DEFAULT_EXCLUSIONS = %w(.git .sass-cache)

    attr_reader :path, :language

    def initialize(config_params)
      @path = config_params['path']
      @language = config_params['language']
      @configured_exclusions = config_params['configured_exclusions']
    end

    def is_excluded?(file)
      absolute_path = Utils::FS.join(path, file)

      exclusions.include?(absolute_path)
    end

    private
      def exclusions
        @exclusions ||= (DEFAULT_EXCLUSIONS + @configured_exclusions.to_a).map do |exclusion|
          Utils::FS.join(path, exclusion)
        end
      end

  end
end
