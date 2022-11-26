# frozen_string_literal: true

require 'httparty'
require 'learning_360/entities/resource'
require 'learning_360/entities/user'
require 'learning_360/entities/user_invitation'
require 'learning_360/entities/skill'
require 'learning_360/entities/course'
require 'learning_360/entities/group'
require 'learning_360/entities/path'
require 'learning_360/entities/path_session'
require 'learning_360/entities/user_custom_field'
require 'learning_360/entities/program_session'
require 'learning_360/entities/program_template'
require 'learning_360/client/users'
require 'learning_360/client/groups'
require 'learning_360/client/courses'
require 'learning_360/client/programs'
require 'learning_360/client/skills'
require 'learning_360/client/paths'
require 'learning_360/client/user_custom_fields'

module Learning360
  class ApiResponseError < StandardError; end
  # client for 360learning API
  class Client
    include HTTParty
    include Learning360::Client::Users
    include Learning360::Client::Groups
    include Learning360::Client::Courses
    include Learning360::Client::Programs
    include Learning360::Client::Skills
    include Learning360::Client::UserCustomFields
    include Learning360::Client::Paths

    attr_accessor :api_key, :company_id
    base_uri 'https://app.360learning.com/api/v1'

    # Initializes a new Client object
    #
    # @param options [Hash]
    # @return [Learning360::Client]
    def initialize(options = {})
      options.each do |key, value|
        instance_variable_set("@#{key}", value)
      end
      yield(self) if block_given?
    end

    def init!
      self.class.default_options.merge!(
        query: {
          apiKey: api_key,
          company: company_id
        }
      )
      self
    end

    # @return [Hash]
    def credentials
      {
        api_key: api_key,
        company_id: company_id
      }
    end

    def request(resource = nil)
      parsed_response = JSON.parse(yield)
      error_message = parsed_response['error'] || parsed_response['message'] if parsed_response.is_a? Hash
      raise(ApiResponseError, error_message) if error_message
      return parsed_response.map{ |item| resource.new(item) } if parsed_response.is_a?(Array) && resource
      return resource.new(parsed_response) if resource

      parsed_response
    end
  end
end
