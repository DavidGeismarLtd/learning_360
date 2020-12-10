# frozen_string_literal: true

require './spec/spec_helper'

RSpec.describe Learning360::Client::Courses do
  let(:client) do
    Learning360::Client.new do |client|
      client.api_key = ENV['LEARNING_API_KEY']
      client.company_id = ENV['LEARNING_COMPANY_ID']
    end.init!
  end

  # describe '#get' do
  #   # it 'if it doesnt have the course, it raises an error' do
  #   #   VCR.use_cassette('courses/get_course/error') do
  #   #     expect do
  #   #       client.get_course('dageismar@gmail.com')
  #   #     end.to raise_error(
  #   #       RuntimeError,
  #   #       'course_not_found'
  #   #     )
  #   #   end
  #   # end
  #
  #   it 'given a email, it returns the correct course object' do
  #     VCR.use_cassette('courses/get_course/success') do
  #       resp = client.get_course('axel.assouline@gmail.com')
  #       expect(resp.class).to eq(Learning360::Course)
  #       expect(resp.firstName).to eq('Axel')
  #     end
  #   end
  # end

  describe '#get_courses' do
    it 'it returns all courses for the current account' do
      VCR.use_cassette('courses/get_courses/success') do
        resp = client.get_courses
        expect(resp.class).to eq(Array)
        expect(resp.first.class).to eq(Learning360::Course)
      end
    end
  end
end
