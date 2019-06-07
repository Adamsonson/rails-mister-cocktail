# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
response = HTTParty.get(url)
response.parsed_response['drinks'].each do |ingredient|
  Ingredient.new(name: ingredient['strIngredient1']).save!
end

url = "http://static.giantbomb.com/uploads/original/9/99864/2419866-nes_console_set.png"
cocktail = Article.new(name: 'NES')
cocktail.remote_photo_url = url
cocktail.save
