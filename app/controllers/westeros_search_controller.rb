class WesterosSearchController < ApplicationController

  def index
    require "pry"; binding.pry
    @conn = Faraday.new(url: "http://westerosapi.herokuapp.com") do |faraday|
  
		  faraday.params['api_key'] = 'egg'
		  faraday.params['house'] = params['q']
		  faraday.adapter Faraday.default_adapter
		end

    require "pry"; binding.pry

    response = @conn.get("/api/v1/house/")

    results = JSON.parse(response.body)

    @search_term = params[:q]

  end

end
