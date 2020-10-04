require './spec/spec_helper'

RSpec.describe Learning360::Client::Users do
  let(:client) { Learning360::Client.new }

  describe "#get" do
    it "if it doesnt have the user, it raises an error" do
      VCR.use_cassette('users/get_user/error') do
        expect {
          client.get_user("dageismar@gmail.com")
        }.to raise_error(
          RuntimeError,
          "user_not_found"
        )
      end
    end

    it "given a email, it returns the correct user object" do
      VCR.use_cassette('users/get_user/success') do
        resp = client.get_user("davidgeismar@hotmail.fr")
        expect(resp).to eq(Learning360::User)
      end
    end
  end
end
