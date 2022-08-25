# frozen_string_literal: true

module Learning360
  class Client
    module UserCustomFields
      BASE = '/customfields'

      def create_custom_field(options = {})
        response = self.class.post("#{BASE}", {
                                     body: options.to_query,
                                     headers: {
                                       'Content-Type' => 'application/x-www-form-urlencoded'
                                     }
                                   })
        JSON.parse(response.body)
      end

      def update_custom_field(custom_field_id, options={})
        response = self.class.put("#{BASE}/#{custom_field_id}", {
                                    body: options.to_query,
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def add_custom_field_value(collection, target_id, custom_field_id, custom_field_value)
        options = {
          customFieldId: custom_field_id,
          value: custom_field_value
        }
        response = self.class.put("/#{collection}/#{target_id}#{BASE}", {
                                    body: options.to_query,
                                    headers: {
                                      'Content-Type' => 'application/x-www-form-urlencoded'
                                    }
                                  })
        JSON.parse(response.body)
      end

      def delete_custom_field(custom_field_id)
        response = self.class.delete("#{BASE}/#{custom_field_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def remove_custom_field_value(custom_field_id, collection_name, target_id)
        response = self.class.delete("#{BASE}/#{custom_field_id}/#{collection_name}/#{target_id}", {
                                       headers: {
                                         'Content-Type' => 'application/json'
                                       }
                                     })
        JSON.parse(response.body)
      end

      def retrieve_custom_fields
        request(UserCustomField) do
          response = self.class.get(BASE, {
                                      headers: {
                                        'Content-Type' => 'application/json'
                                      }
                                    }).body
        end
      end
    end
  end
end
