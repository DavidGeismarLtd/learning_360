# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Learning360::Client::Users do
  let(:client) do
    Learning360::Client.new do |client|
      client.api_key = ENV['LEARNING_API_KEY']
      client.company_id = ENV['LEARNING_COMPANY_ID']
    end.init!
  end

  describe '#create_or_invite_user' do
    it 'when no password is defined it sends an invitation' do
      VCR.use_cassette('users/create_or_invite_user/invitation') do
        resp = client.create_or_invite_user(
          mail: 'david.geismar.ext@qonto.com'
        )
        expect(resp.status).to eq("invitation_created")
      end
    end
  end
  describe '#get_user' do
    it 'if it doesnt have the user, it raises an error' do
      VCR.use_cassette('users/get_user/error') do
        expect do
          client.get_user('dageismar@gmail.com')
        end.to raise_error(
          RuntimeError,
          'user_not_found'
        )
      end
    end

    it 'given a email, it returns the correct user object' do
      VCR.use_cassette('users/get_user/success') do
        resp = client.get_user('axel.assouline@gmail.com')
        expect(resp.class).to eq(Learning360::User)
        expect(resp.firstName).to eq('Axel')
      end
    end
  end

  describe '#get_users' do
    it 'it returns all users for the current account' do
      VCR.use_cassette('users/get_users/success') do
        resp = client.get_users
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::User)
      end
    end
  end
end
