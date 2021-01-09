# frozen_string_literal: true

module Learning360
  class Group
    attr_accessor(
      :_id,
      :name,
      :public,
      :parent
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
