module Learning360
  class UserInvitation
    attr_accessor(
      :status,
      :_id
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
