# frozen_string_literal: true

module Learning360
  class Client
    module Groups
      BASE = '/groups'
      def create_group(options = {})
        response = self.class.post(BASE, {
                                     body: options.to_query,
                                     headers: {
                                       'Content-Type' => 'application/x-www-form-urlencoded'
                                     }
                                   })
        JSON.parse(response.body)
      end

      def update_group(id, options = {})
        response = self.class.put("BASE/#{id}", {
                                    params: { user_email: email },
                                    body: options.to_query,
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def get_group(id)
        response = self.class.get("#{BASE}/#{id}", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def groups
        request(Group) do
          self.class.get(BASE, {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end

      def delete_group(id)
        response = self.class.delete("#{BASE}/#{id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def add_user_to_group(group_id, user_email, options = {})
        response = self.class.put("#{BASE}/#{group_id}/users/#{user_email}", {
                                    body: options.to_query,
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def remove_user_from_group(id, user_email, options = {})
        response = self.class.delete("#{BASE}/#{id}/users/#{user_email}", {
                                       body: options.to_query,
                                       headers: {
                                         'Content-Type' => 'application/x-www-form-urlencoded'
                                       }
                                     })
        response.success?
      end

      # Returns the program sessions to which the group has been invited.
      def retrieve_group_program_sessions(group_id)
        request(ProgramSession) do
          self.class.get("#{BASE}/#{group_id}/programs", {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end

      def add_to_catalog(id, options = {})
        response = self.class.delete("#{BASE}/#{id}/catalog", {
                                       body: options.to_query,
                                       headers: {
                                         'Content-Type' => 'application/x-www-form-urlencoded'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def delete_from_catalog(id, options = {})
        response = self.class.put("#{BASE}/#{id}/catalog", {
                                    body: options.to_query,
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end
    end
  end
end
