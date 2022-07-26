# frozen_string_literal: true

module Learning360
  class Client
    module Skills
      BASE = '/skills'

      def retrieve_skills
        request(Skill) do
          self.class.get(BASE, {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end
    end
  end
end
