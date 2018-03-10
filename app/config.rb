# frozen_string_literal: true
require "yaml"
require "optparse"

class Config
  DEFAULT_CONFIG_FILE  = "config/config.yml"
  VALID_CONFIG_OPTIONS = {
    apps:    [],
    daemon:  false,
    logfile: nil,
    pidfile: nil,
  }

  attr_reader :options

  class << self
    VALID_CONFIG_OPTIONS.each do |key, default_value|
      define_method(key) do
        config.options[key] || default_value
      end
    end

    def config
      @config ||= new
    end
  end

  def initialize
    @options = {}
    parser.parse!
    parse_config_file
  end

  private
    def parser
      @parser ||= OptionParser.new do |o|
        o.on "-d", "--daemon", "Daemonize process" do
          options[:daemon] = true
        end

        o.on "-c", "--config PATH", "path to YAML config file" do |arg|
          options[:config_file] = arg
        end

        o.on "-l", "--logfile PATH", "path to writable logfile" do |arg|
          options[:logfile] = arg
        end

        o.on "-p", "--pidfile PATH", "path to pidfile" do |arg|
          options[:pidfile] = arg
        end
      end
    end

    def config_file
      options[:config_file] || DEFAULT_CONFIG_FILE
    end

    def parse_config_file
      check_config_file!

      YAML.load_file(config_file).each do |key, value|
        options[key.to_sym] ||= value
      end
    end

    def check_config_file!
      if !File.exist?(config_file)
        puts "Configuration file is not found"
        exit 1
      end
    end

    def validate_daemonization!
      if options[:daemon] && !(options[:logfile] && options[:pidfile])
        puts "Can not be deamonized without logfile and pidfile options"
        puts parser.on_tail "-h"
        exit 1
      end
    end

end
