# frozen_string_literal: true
require_relative "word_cloud.rb"

class CLI

  class << self
    def start
      WordCloud.run
    end

  end

end
