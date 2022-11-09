# frozen_string_literal: true

module Learning360
  class Client
    module Paths
      BASE = '/paths'

      def retrieve_paths(options = {})
        request(Path) do
            self.class.get(BASE, {
                                      body: options.to_query,
                                      headers: {
                                        'Content-Type' => 'application/json'
                                      }
                                    }).body
        end
      end

      def get_paths_sessions
        request(ProgramSession) do
          self.class.get("#{BASE}/sessions", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end

      def get_paths_users(path_id)
        request(User) do
          self.class.get("#{BASE}/#{path_id}/users", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end

      def get_path_session_users(session_id)
        request(User) do
          self.class.get("#{BASE}/sessions/#{session_id}/users", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end
      #
      # def get_path_session_stats(session_id)
      #   response = self.class.get(
      #     "#{BASE}/sessions/#{session_id}/stats", {
      #     headers: {
      #       'Content-Type' => 'application/json'
      #     }
      #   }).body
      # end
      def get_group_path_sessions(group_id)
        request(Path) do
          self.class.get("groups/#{group_id}/pathsSessions", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end

      def get_user_path_session_stats(session_id, user_email_or_id)
        request(Path) do
          self.class.get("#{BASE}/sessions/#{session_id}/stats/#{user_email_or_id}", {
                                    headers: {
                                      'Content-Type' => 'application/json'
                                    }
                                  }).body
        end
      end

      def add_users_to_path_session(session_id, user_emails=[])
        response =  self.class.patch("#{BASE}/sessions/#{session_id}/users", {
                                  body: {
                                    userEmails: user_emails
                                  }.to_query,
                                  headers: {
                                    'Content-Type' => 'application/json'
                                  }
                                }).body
        JSON.parse(response.body)
      end

      def add_groups_to_path_session(session_id, group_ids=[])
        response =  self.class.patch("#{BASE}/sessions/#{session_id}/groups", {
                                  body: {
                                    groupIds: group_ids
                                  }.to_query,
                                  headers: {
                                    'Content-Type' => 'application/json'
                                  }
                                }).body
        JSON.parse(response.body)
      end

      def delete_path_session(session_id)
        response = self.class.delete("#{BASE}/sessions/#{session_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def remove_users_from_path_session(session_id, user_emails=[])
        response = self.class.delete("#{BASE}/sessions/#{session_id}/users", {
                                       body: {
                                        userEmails: user_emails
                                       }.to_query,
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def remove_groups_from_path_session(session_id, group_ids=[])
        response = self.class.delete("#{BASE}/sessions/#{session_id}/users", {
                                       body: {
                                        groupIds: group_ids
                                       }.to_query,
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end
    end
  end
end
