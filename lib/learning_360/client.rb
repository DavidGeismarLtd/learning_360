# frozen_string_literal: true

require 'httparty'
require 'learning_360/user'
require 'learning_360/skill'
require 'learning_360/program_template'
require 'learning_360/client/users'
require 'learning_360/client/groups'
require 'learning_360/client/courses'
require 'learning_360/client/programs'
require 'learning_360/client/skills'
require 'pry-byebug'

module Learning360
  # client for 360learning API
  class Client
    include HTTParty
    include Learning360::Client::Users
    include Learning360::Client::Groups
    include Learning360::Client::Courses
    include Learning360::Client::Programs
    include Learning360::Client::Skills
    base_uri 'app.360learning.com/api/v1'

    def initialize(api_key = nil, company_id = nil)
      api_key ||= ENV['LEARNING_API_KEY']
      company_id ||= ENV['LEARNING_COMPANY_ID']
      self.class.default_options.merge!(
        query: {
          apiKey: api_key,
          company: company_id
        }
      )
    end

    def request(resource = nil)
      parsed_response = JSON.parse(yield)
      error_message = parsed_response['error'] || parsed_response['message'] if parsed_response.is_a? Hash
      raise error_message if error_message
      return parsed_response.map{ |item| resource.new(item) } if parsed_response.is_a?(Array) && resource
      return resource.new(parsed_response) if resource

      parsed_response
    end
  end
end
