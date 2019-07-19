class WesterosSearchController < ApplicationController

  def index

    def houses
      if params[:q] == 'stark'
        1
      elsif params[:q] == 'lannister'
        2
      elsif params[:q] == 'targaryen'
        3
      elsif params[:q] == 'tyrell'
        4
      elsif params[:q] == 'greyjoy'
        5
      else
        {}
      end
    end

    @search_term = params[:q]

    @conn = Faraday.new(url: "https://westeros-as-a-service.herokuapp.com") do |faraday|
		  faraday.params['api_key'] = 'egg'
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
