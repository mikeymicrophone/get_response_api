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
      query = ""
      if options[:campaign_id]
        query += "query[campaignId]=#{options[:campaign_id]}&"
      end
      if options[:email_address]
        query += "query[email]=#{options[:email_address]}&"
      end
      @connection.request(:get, "/contacts?#{query}")
    end
    end

    def custom_fields
      @connection.request(:get, '/custom-fields')
    end
  end
end
