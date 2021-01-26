# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Learning360::Client::Programs do
  let(:client) do
    Learning360::Client.new do |client|
      client.api_key = ENV['LEARNING_API_KEY']
      client.company_id = ENV['LEARNING_COMPANY_ID']
    end.init!
  end

  describe '#get' do
    it 'if it doesnt have the template, it raises an error' do
      VCR.use_cassette('programs/get_template/error') do
        expect do
          client.get_template('template')
        end.to raise_error(
          RuntimeError,
          'Not Found'
        )
      end
    end

    it 'given a template id, it returns the correct program template object' do
      VCR.use_cassette('programs/get_template/success') do
        resp = client.get_template('5f58f89755fcd368997fbcf9')
        expect(resp.class).to eq(Learning360::ProgramTemplate)
        expect(resp.name).to eq('Parodontologie')
      end
    end
  end

  describe '#retrieve_program_session_users' do
    it 'it returns the correct session users' do
      VCR.use_cassette('programs/session_users/success') do
        resp = client.retrieve_program_session_users('5ff5787ad215535086122c48')
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::User)
      end
    end
  end

  describe '#program_templates' do
    it 'it returns the correct program templates' do
      VCR.use_cassette('programs/templates/success') do
        resp = client.program_templates
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::ProgramTemplate)
      end
    end
  end

  describe '#retrieve_sessions' do
    it 'it returns the correct program sessions' do
      VCR.use_cassette('programs/sessions/success') do
        resp = client.retrieve_sessions
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::ProgramSession)
      end
    end
  end

  describe '#remove_user_from_session' do
    it 'it returns true' do
      VCR.use_cassette('groups/remove_user_from_session/success') do
        resp = client.remove_user_from_session('5ff5787ad215535086122c48', 'david@zedental.com')
        expect(resp).to eq(true)
      end
    end
  end
end
