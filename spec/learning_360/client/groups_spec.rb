# frozen_string_literal: true

require './spec/spec_helper'
RSpec.describe Learning360::Client::Groups do
  let(:client) do
    Learning360::Client.new do |client|
      client.api_key = ENV['LEARNING_API_KEY']
      client.company_id = ENV['LEARNING_COMPANY_ID']
    end.init!
  end

  describe '#groups' do
    it 'return all the groups for the current company' do
      VCR.use_cassette('groups/groups/success') do
        resp = client.groups
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::Group)
      end
    end
  end

  describe '#retrieve_group_program_sessions' do
    it 'it returns all programs for the current group' do
      VCR.use_cassette('groups/get_group_programs/success') do
        resp = client.retrieve_group_program_sessions("5f6dc117e6e9cc73fb347b07")
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::ProgramSession)
      end
    end
  end

  describe 'remove_user_from_group' do
    it 'it returns true' do
      VCR.use_cassette('groups/delete_user_from_group/success') do
        resp = client.remove_user_from_group("5ffd6be7bbb92976f9f1b4dc", "david@zedental.com")
        expect(resp).to eq(true)
      end
    end
  end
end
