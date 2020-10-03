require 'client/users'
require 'client/groups'
require 'client/courses'
require 'client/programs'
require 'client/skills'

module Learning360
  class Client
    include HTTParty
    include Learning360::Client::Users
    include Learning360::Client::Groups
    include Learning360::Client::Courses
    include Learning360::Client::Programs
    include Learning360::Client::Skills
    base_uri 'app.360learning.com/api/v1'

    def initialize(api_key = nil, company_id = nil)
      api_key = api_key || ENV["360_LEARNING_API_KEY"]
      company_id = company_id || ENV["360_LEARNING_COMPANY_ID"]
      self.class.default_options.merge!(query: { apiKey: api_key, company: company_id })
    end
  end
end
