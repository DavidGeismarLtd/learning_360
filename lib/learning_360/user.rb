module Learning360
  class User
    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
