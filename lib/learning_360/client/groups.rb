module Learning360
  class Client
    module Groups
      BASE = '/groups'
      def create(options = {})
       response = self.class.post(BASE, {
         body: URI.encode_www_form(options),
         headers: {
           "Content-Type" => "application/x-www-form-urlencoded"
         },
       })
        JSON.parse(response.body)
      end

      def update(id, options = {})
        response = self.class.put("BASE/#{id}", {
           params: { user_email: email },
           body: URI.encode_www_form(options),
           headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           },
         })
         JSON.parse(response.body)
      end

      def get(id)
       response = self.class.get("#{BASE}/#{id}", {
         headers: {
           "Content-Type" => "application/json"
         },
       })
       JSON.parse(response.body)
      end

      def get_groups
        response = self.class.get(BASE, {
          headers: {
            "Content-Type" => "application/json"
          },
        })
        JSON.parse(response.body)
      end

      def delete(id)
        response = self.class.delete("#{BASE}/#{id}", {
          headers: {
            "Content-Type" => "application/json"
          },
        })
        JSON.parse(response.body)
      end

      def add_user(group_id, user_email, options={})
        response = self.class.put("#{BASE}/#{group_id}/users/#{user_email}", {
          body: URI.encode_www_form(options),
          headers: {
            "Content-Type" => "application/x-www-form-urlencoded"
          },
        })
        JSON.parse(response.body)
      end

      def delete_user(id, user_email, options={})
        response = self.class.delete("#{BASE}/#{id}/users/#{user_email}", {
          body: URI.encode_www_form(options),
          headers: {
            "Content-Type" => "application/x-www-form-urlencoded"
          },
        })
        JSON.parse(response.body)
      end

      def get_programs(id)
        response = self.class.put("#{BASE}/#{id}/programs" {
           headers: {
             "Content-Type" => "application/json"
           },
         })
         JSON.parse(response.body)
      end

      def add_to_catalog(id, options={})
        response = self.class.delete("#{BASE}/#{id}/catalog" {
           body: URI.encode_www_form(options),
           headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           },
         })
         JSON.parse(response.body)
      end

      def delete_from_catalog(id, options={})
        response = self.class.put("#{BASE}/#{id}/catalog" {
          body: URI.encode_www_form(options),
          headers: {
             "Content-Type" => "application/x-www-form-urlencoded"
           },
         })
         JSON.parse(response.body)
      end
    end
  end
end
