# frozen_string_literal: true

module Learning360
  class Client
    module Users
      BASE = '/users'
      def create_or_invite_user(options = {})
        request(User) do
          self.class.post(BASE, {
                            body: URI.encode_www_form(options),
                            headers: {
                              'Content-Type' => 'application/x-www-form-urlencoded'
                            }
                          }).body
        end
      end

      def update_user(email, options = {})
        request(User) do
          self.class.put(BASE, {
                           params: { user_email: email },
                           body: URI.encode_www_form(options),
                           headers: {
                             'Content-Type' => 'application/x-www-form-urlencoded'
                           }
                         }).body
        end
      end

      def get_user(email)
        request(User) do
          self.class.get("#{BASE}/#{email}", {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end

      def get_users
        request(User) do
          self.class.get(BASE, {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end

      def delete_user(email)
        request(User) do
          self.class.delete("#{BASE}/#{email}", {
                              headers: {
                                'Content-Type' => 'application/json'
                              }
                            }).body
        end
      end

      def user_programs(id)
        request(User) do
          self.class.get("#{BASE}/#{id}/programs", {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         }).body
        end
      end

      def user_courses(id)
        request(User) do
          self.class.get("#{BASE}/#{id}/courses", {
                           headers: {
                             'Content-Type' => 'application/json'
                           }
                         })
        end
      end

      def add_manager_to_user(user_email, manager_email)
        request(User) do
          self.class.put("#{BASE}/#{user_email}/managers/#{manager_email}", {
                           headers: {
                             'Content-Type' => 'application/x-www-form-urlencoded'
                           }
                         }).body
        end
       end

      def delete_manager_from_user(user_email, manager_email)
        request(User) do
          self.class.delete("#{BASE}/#{user_email}/managers/#{manager_email}", {
                              headers: {
                                'Content-Type' => 'application/x-www-form-urlencoded'
                              }
                            }).body
        end
      end

      def unsubscribe_to_email_notifications(emails = [])
        request(User) do
          self.class.put("#{BASE}/unsubscribeToEmailNotifications", {
                           body: { usersEmails: emails },
                           headers: {
                             'Content-Type' => 'application/x-www-form-urlencoded'
                           }
                         }).body
        end
      end

      def subscribe_to_email_notifications(emails = [])
        request(User) do
          self.class.put("#{BASE}/subscribeToEmailNotifications", {
                           body: { usersEmails: emails },
                           headers: {
                             'Content-Type' => 'application/x-www-form-urlencoded'
                           }
                         }).body
        end
      end

      def add_external_id(email, external_platform, external_id)
        request(User) do
          self.class.put("#{BASE}/#{email}/externalId", {
                           body: { externalPlatform: external_platform, externalId: external_id },
                           headers: {
                             'Content-Type' => 'application/x-www-form-urlencoded'
                           }
                         }).body
        end
      end
    end
  end
end
