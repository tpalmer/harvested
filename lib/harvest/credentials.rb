module Harvest
  class Credentials
    attr_accessor :access_token, :ssl

    def initialize(access_token, ssl = true)
      @access_token, @ssl = access_token, ssl
    end

    def valid?
      !access_token.nil?
    end

    def host
      "#{ssl ? "https" : "http"}://api.harvestapp.com"
    end
  end
end