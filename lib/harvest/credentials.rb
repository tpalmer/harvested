module Harvest
  class Credentials
    attr_accessor :subdomain, :username, :password, :ssl, :access_token

    def initialize(subdomain, username, password, ssl = true, access_token = false)
      @subdomain, @username, @password, @ssl, @access_token = subdomain, username, password, ssl, access_token
    end

    def valid?
      if access_token
        !access_token.nil?
      else
        !subdomain.nil? && !username.nil? && !password.nil?
      end
    end

    def basic_auth
      Base64.encode64("#{username}:#{password}").delete("\r\n")
    end

    def host
      "#{ssl ? "https" : "http"}://#{subdomain}.harvestapp.com"
    end
  end
end