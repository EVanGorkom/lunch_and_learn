require 'rails_helper'

RSpec.describe 'Favorite Serializer' do
  it "returns the JSON favorite object within the serializer's format" do
    user = User.create(name: 'John', email: 'john@example.com', password: 'secret-password', password_confirmation: 'secret-password')
    fav1 = user.favorites.create(country: 'japan', recipe_link: "https://www.supertastyfood.com/", recipe_title: "The Best Tonkatsu Ramen")
    fav2 = user.favorites.create(country: 'mexico', recipe_link: "https://www.supertastyfood.com/", recipe_title: "The Best Flautas Ever")

    serialized_fav = FavoriteSerializer.new(user.favorites)

    expected_format = {
      data: [
        {
          id: "#{fav1.id}",
          type: "favorite",
          attributes: {
            recipe_title: "The Best Tonkastsu Ramen",
            recipe_link: 'https://www.supertastyfood.com/',
            country: 'Tasty Town',
            created_at: "#{fav1.created_at}"
          }
        },
        {
          id: "#{fav2.id}",
          type: "favorite",
          attributes: {
            recipe_title: 'Tres Leches',
            recipe_link: 'https://www.supertastyfood.com/',
            country: 'Tasty Town',
            created_at: "#{fav2.created_at}"
          }
        }
      ]
    }     
  end
end