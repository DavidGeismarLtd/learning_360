require './spec/spec_helper'

RSpec.describe Learning360::Client::Programs do
  let(:client) { Learning360::Client.new }

  describe "#get" do
    it "if it doesnt have the template, it raises an error" do
      VCR.use_cassette('programs/get_template/error') do
        expect {
          client.get_template("template")
        }.to raise_error(
          RuntimeError,
          "Not Found"
        )
      end
    end

    it "given a template id, it returns the correct program template object" do
      VCR.use_cassette('programs/get_template/success') do
        resp = client.get_template("5f58f89755fcd368997fbcf9")
        expect(resp.class).to eq(Learning360::ProgramTemplate)
        expect(resp.name).to eq("Parodontologie")
      end
    end
  end
end
