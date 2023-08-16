$LOAD_PATH.push(__dir__)
require "learning_360/configuration"
require "learning_360/version"
require "learning_360/client"


module Learning360
  class << self
    attr_writer :configuration

    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end
end