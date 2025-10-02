require 'net/http'
require 'uri'
require 'cgi'
require 'json'

class RecipesController < ApplicationController
  def search
    @query = params[:q] 
    url = URI("https://api.spoonacular.com/recipes/complexSearch?query=#{CGI.escape(@query)}&apiKey=#{ENV['SPOONACULAR_API_KEY']}")
    search_response = Net::HTTP.get(url)
    search_results = JSON.parse(search_response)["results"] || []

    @recipes = search_results.map do |recipe|
      info_url = URI("https://api.spoonacular.com/recipes/#{recipe['id']}/information?apiKey=#{ENV['SPOONACULAR_API_KEY']}")
      info_response = Net::HTTP.get(info_url)
      JSON.parse(info_response) 
    end
  end
end

