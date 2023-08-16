module Learning360
  class Configuration
    attr_accessor :log_level, :logger

    def initialize
      @logger = nil
    end
  end
end
