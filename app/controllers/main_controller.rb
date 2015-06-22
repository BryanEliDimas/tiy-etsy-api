class MainController < ApplicationController
  def index
    Dotenv.load

    url = "https://openapi.etsy.com/v2/listings/active?api_key=#{ENV.fetch("ETSY_API_KEY")}&includes=MainImage"
    json = JSON.parse Http.get(url)
    data = json.to_hash

    @listings = data["results"].first(10)
  end
end
