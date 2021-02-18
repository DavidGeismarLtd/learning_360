# frozen_string_literal: true

module Learning360
  class ProgramSession
    attr_accessor(
      :_id,
      :name,
      :programTemplate,
      :author,
      :tutors,
      :description,
      :startDate,
      :endDate,
      :hasUserLimit,
      :userLimit,
      :programDuration,
      :programDurationType,
      :skills,
      :sessionCustom,
      :templateCustom,
      :validateRegistrations,
      :modules,
      :groups
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
