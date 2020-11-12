# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Learning360::Client::Skills do
  let(:client) { Learning360::Client.new }

  # describe '#get' do
  #   # it 'if it doesnt have the skill, it raises an error' do
  #   #   VCR.use_cassette('skills/get_skill/error') do
  #   #     expect do
  #   #       client.get_skill('dageismar@gmail.com')
  #   #     end.to raise_error(
  #   #       RuntimeError,
  #   #       'skill_not_found'
  #   #     )
  #   #   end
  #   # end
  #
  #   it 'given a email, it returns the correct skill object' do
  #     VCR.use_cassette('skills/get_skill/success') do
  #       resp = client.get_skill('axel.assouline@gmail.com')
  #       expect(resp.class).to eq(Learning360::Skill)
  #       expect(resp.firstName).to eq('Axel')
  #     end
  #   end
  # end

  describe '#get_skills' do
    it 'it returns all skills for the current account' do
      VCR.use_cassette('skills/get_skills/success') do
        resp = client.get_skills
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::Skill)
      end
    end
  end
end
