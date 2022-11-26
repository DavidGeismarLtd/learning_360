# frozen_string_literal: true

module Learning360
  module Entities
    # base resource class
    class Resource
      def initialize(options = {})
        options.map do |(k, v)|
          self.class.attr_accessor(k)
          send("#{k}=", v)
        end
      end
    end
  end
end
