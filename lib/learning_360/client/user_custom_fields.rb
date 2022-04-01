# frozen_string_literal: true

module Learning360
  class Client
    module UserCustomFields
      BASE = '/customfields'

      def list_custom_fields
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
