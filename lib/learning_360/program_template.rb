module Learning360
  class ProgramTemplate
    attr_accessor(
      :_id,
      :name,
      :author,
      :description,
      :elements,
      :templateCustom,
      :skills
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
