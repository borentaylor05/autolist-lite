

# This is a dead simple class right now, but in a production app
# you would likely have many more class methods to interface with the API
class AutolistClient
  BASE_URL = 'https://qa878qmgjk.execute-api.us-east-1.amazonaws.com'
  # I'm assuming dev is an API Gateway stage name
  API_STAGE = Rails.env  === 'development' ? 'dev' : 'prod'

  def initialize
    @connection = Faraday.new(
      url: BASE_URL,
      headers: {
        'x-api-key' => ENV['AUTOLIST_API_KEY'],
        'Content-Type' => 'application/json'
      }
    )
  end

  def search(min_price, max_price, page)
    @connection.get "/#{API_STAGE}", {
      price_min: min_price,
      price_max: max_price,
      page: page
    }
  end
end
