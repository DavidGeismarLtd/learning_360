# frozen_string_literal: true

module Learning360
  class Course
    attr_accessor(
      :_id,
      :name,
      :author,
      :description,
      :status,
      :skills,
      :creationDate,
      :modificationDate
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
