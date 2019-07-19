class WesterosSearchController < ApplicationController

  def index
    @search_term = params[:q]

    @conn = Faraday.new(url: "http://westerosapi.herokuapp.com") do |faraday|
	    faraday.params['api_key'] = ENV['WESTEROS_API_KEY']
		  faraday.params['house'] = params['q']
		  faraday.adapter Faraday.default_adapter
		end

    response = @conn.get("/api/v1/house/#{@search_term}")

    result = JSON.parse(response.body, symbolize_names: true)[:data]

    @house = result[0][:attributes]

    @members = result[0][:attributes][:members].map do |result|
      Member.new(result)
    end
  end
end
