module Learning360
  class User
    attr_accessor(
      :_id,
      :mail,
      :firstName,
      :lastName,
      :assignedPrograms,
      :paths,
      :certifications,
      :championAchievements,
      :comments,
      :completedPrograms,
      :groups,
      :imageUrl,
      :labels,
      :lastLoginAt,
      :championStatus,
      :learnerAchievements,
      :managers,
      :messages,
      :publications,
      :reactions,
      :skills,
      :subordinates,
      :toDeactivateAt,
      :totalTimeSpentInMinutes,
      :custom
    )

    def initialize(options = {})
      options.map { |(k, v)| send("#{k}=", v) }
    end
  end
end
