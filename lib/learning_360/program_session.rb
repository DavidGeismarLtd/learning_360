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
      :programDuration,
      :programDurationType,
      :skills,
      :sessionCustom,
      :templateCustom,
      :validateRegistrations
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
