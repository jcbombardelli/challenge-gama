# encoding: UTF-8
require 'rubygems'
require 'sinatra'
require 'httparty'
require 'httparty'

get '/' do

	endereco = params["url"]

	if(endereco != nil)

		urlescapada = URI.escape(endereco)
		urlg = "http://maps.google.com/maps/api/geocode/json?address=#{urlescapada}"
		response = HTTParty.get(urlg)
		parsed   = JSON.parse(response.body)['results']
		result = parsed
	end

	
  	erb :index, :locals => {result: parsed}
end
