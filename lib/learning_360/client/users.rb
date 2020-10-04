module Learning360
  class Client
    module Users
      BASE = '/users'
      def create_or_invite_user(options = {})
       response = self.class.post(BASE, {
         body: URI.encode_www_form(options),
         headers: {
           "Content-Type" => "application/x-www-form-urlencoded"
         }
       }).body
      end

      def update_user(email, options = {})
        response = self.class.put(BASE, {
           params: { user_email: email },
           body: URI.encode_www_form(options),
           headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           }
         })
         JSON.parse(response.body)
      end

      def get_user(email)
        request(User) do
          response = self.class.get("#{BASE}/#{email}", {
            headers: {
              "Content-Type" => "application/json"
            }
          }).body
        end
           # User.new user_options
      end

      def get_users
        response = self.class.get(BASE, {
          headers: {
            "Content-Type" => "application/json"
          }
        })
        JSON.parse(response.body)
      end

      def delete_user(email)
        response = self.class.delete("#{BASE}/#{email}", {
          headers: {
            "Content-Type" => "application/json"
          }
        })
        JSON.parse(response.body)
      end

      def user_programs(id)
        response = self.class.get("#{BASE}/#{id}/programs", {
          headers: {
            "Content-Type" => "application/json"
          }
        })
        JSON.parse(response.body)
      end

      def user_courses(id)
        response = self.class.get("#{BASE}/#{id}/courses", {
          headers: {
            "Content-Type" => "application/json"
          }
        })
        JSON.parse(response.body)
      end

      def add_manager_to_user(user_email, manager_email)
        response = self.class.put("#{BASE}/#{user_email}/managers/#{manager_email}", {
           headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           }
         })
         JSON.parse(response.body)
      end

      def delete_manager_from_user(user_email, manager_email)
        response = self.class.delete("#{BASE}/#{user_email}/managers/#{manager_email}", {
           headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           }
         })
         JSON.parse(response.body)
      end

      def unsubscribe_to_email_notifications(emails = [])
        response = self.class.put("#{BASE}/unsubscribeToEmailNotifications", {
          body: { usersEmails: emails },
          headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           }
         })
         JSON.parse(response.body)
      end

      def subscribe_to_email_notifications(emails = [])
        response = self.class.put("#{BASE}/subscribeToEmailNotifications", {
          body: { usersEmails: emails },
          headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           }
         })
         JSON.parse(response.body)
      end

      def add_external_id(email, external_platform, external_id)
        response = self.class.put("#{BASE}/#{email}/externalId", {
          body: { externalPlatform: external_platform, externalId: external_id },
          headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           }
         })
         JSON.parse(response.body)
      end
    end
  end
end
