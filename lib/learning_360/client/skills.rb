module Learning360
  class Client
    module Skills
      BASE = '/skills'

      def get_skills
        response = self.class.get(BASE, {
          headers: {
            "Content-Type" => "application/json"
          },
        })
        JSON.parse(response.body)
      end
    end
  end
end
