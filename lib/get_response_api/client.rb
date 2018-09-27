module GetResponseApi
  class Client
    def initialize(api_key)
      @connection = Connection.new(api_key)
    end

    def account
      @connection.request(:get, '/accounts')
    end

    def campaigns(page: 1, per_page: 250)
      @connection.request(:get, "/campaigns?page=#{page}&perPage=#{per_page}")
    end
    
    def contacts options = {}
      if options[:campaign_id]
        @connection.request(:get, "/contacts?query[campaignId]=#{options[:campaign_id]}")
      elsif options[:email_address]
        @connection.request(:get, "/contacts?query[email]=#{options[:email_address]}")
      else
        @connection.request(:get, '/contacts')
      end
    end

    def custom_fields
      @connection.request(:get, '/custom-fields')
    end
  end
end
