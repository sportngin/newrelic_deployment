require "spec_helper"
require "newrelic_deployment"

module NewrelicDeployment
  describe Notification do
    let(:api_key) {"thisisanapikey"}
    let(:app_name) {"thisisanappname"}
    let(:description) {"thisisadescription"}
    let(:changelog) {"thisisachangelog"}
    let(:user) {"thisisauser"}
    let(:revision) {"thisisarevision"}
    let(:options) {{:api_key => api_key, :app_name => app_name}}
    subject {NewrelicDeployment::Notification}

    context "initialize" do
      it "throws an error if :api_key is not set" do
        expect {subject.new()}.to raise_error(RuntimeError,"Must supply :api_key")
      end

      it "throws an error if :app_name is not set" do
        expect {subject.new(:api_key => api_key)}.to raise_error(RuntimeError,"Must supply :app_name")
      end
    end

    context "#build_request" do
      let(:options) {{:api_key => api_key, :app_name => app_name, :description => description}}
      let(:request) {subject.build_request("path",options)}
      let(:body) {"deployment%5Bapp_name%5D=thisisanappname&deployment%5Bdescription%5D=thisisadescription&deployment%5Bchangelog%5D&deployment%5Buser%5D&deployment%5Brevision%5D"}
      subject {NewrelicDeployment::Notification.new(options)}

      it "should correctly build the request body" do
        expect(request.body).to eq(body)
      end

      it "should correctly set the api_key header" do
        expect(request["x-api-key"]).to eq(api_key)
      end
    end
  end
end
