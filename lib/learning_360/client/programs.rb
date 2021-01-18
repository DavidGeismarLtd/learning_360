# frozen_string_literal: true

module Learning360
  class Client
    module Programs
      BASE = '/programs'

      def get_template(template_id)
        request(ProgramTemplate) do
          self.class.get("#{BASE}/templates/#{template_id}", {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end

      def program_templates
        request(ProgramTemplate) do
          self.class.get("#{BASE}/templates", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end

      def get_templates_users(template_id)
        response = self.class.get("#{BASE}/templates/#{template_id}/users", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def create_session(template_id, options = {})
        response = self.class.post("#{BASE}/programs/#{template_id}/sessions", {
                                     body: URI.encode_www_form(options),
                                     headers: {
                                       'Content-Type' => 'application/x-www-form-urlencoded'
                                     }
                                   })
        JSON.parse(response.body)
      end

      def update_session(template_id, session_id, options = {})
        response = self.class.put("#{BASE}/programs/#{template_id}/sessions/#{session_id}", {
                                    body: URI.encode_www_form(options),
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def get_session(session_id)
        response = self.class.get("#{BASE}/programs/sessions/#{session_id}", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def retrieve_sessions
        request(ProgramSession) do
          self.class.get("#{BASE}/programs/sessions", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end

      def cancel_session(session_id)
        response = self.class.delete("#{BASE}/programs/sessions/#{session_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def add_user_to_session(session_id, user_id)
        response = self.class.put("#{BASE}/programs/sessions/#{session_id}/users/#{user_id}", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def remove_user_from_session(session_id, user_id)
        response = self.class.delete("#{BASE}/programs/sessions/#{session_id}/users/#{user_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def add_group_to_program_session(group_id, session_id)
        response = self.class.put("#{BASE}/programs/sessions/#{session_id}/groups/#{group_id}", {
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def remove_group_to_program_session(group_id, session_id)
        response = self.class.delete("#{BASE}/programs/sessions/#{session_id}/groups/#{group_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def get_program_session_users(session_id)
        response = self.class.get("#{BASE}/programs/sessions/#{session_id}/users", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def get_user_program_session_users(session_id, user_id)
        response = self.class.get("#{BASE}/programs/sessions/#{session_id}/stats/#{user_id}", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def unblock_user_in_scorm(session_id, user_email)
        response = self.class.put("#{BASE}/programs/sessions/#{session_id}/unblockScorm", {
                                    body: { user_email: user_email },
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def get_program_session_stats(session_id, _user_email)
        response = self.class.get("#{BASE}/programs/sessions/#{session_id}/stats", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  })
        JSON.parse(response.body)
      end
    end
  end
end
