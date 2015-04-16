require_relative "newrelic_deployment/version"
require "net/http"
require "uri"

module NewrelicDeployment
  class Notification
    def initialize(options={})
      raise "Must supply :api_key" unless options[:api_key] 
      raise "Must supply :app_name" unless options[:app_name]
      uri = URI.parse("https://api.newrelic.com/deployments.xml")
      https = Net::HTTP.new(uri.host, uri.port)
      https.use_ssl = true
      request = build_request(uri.path,options)
      response = https.request(request)
    end

    def build_request(path,options)
      request = Net::HTTP::Post.new(path)
      request["x-api-key"] = options[:api_key]
      request.set_form_data({ 
        "deployment[app_name]" => options[:app_name],
        "deployment[description]" => options[:description],
        "deployment[changelog]" => options[:changlog],
        "deployment[user]" => options[:user],
        "deployment[revision]" => options[:revions]
      })
      request
    end

  end
end

