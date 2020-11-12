# frozen_string_literal: true

module Learning360
  class Client
    module Courses
      BASE = '/courses'

      def get_courses
        request(Course) do
          response = self.class.get(BASE, {
                                      headers: {
                                        'Content-Type' => 'application/json'
                                      }
                                    }).body
        end
      end

      def get_user_course_stats(course_id, user_email)
        response = self.class.get("#{BASE}/#{course_id}/stats/#{user_email}", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end
    end
  end
end
