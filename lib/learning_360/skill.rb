module Learning360
  class Skill
    attr_accessor(
      :_id,
      :name,
      :author,
      :tutors,
      :startDate,
      :endDate,
      :programDuration,
      :modules,
      :users,
      :isMain
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
