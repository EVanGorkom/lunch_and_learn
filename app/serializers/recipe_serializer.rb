class RecipeSerializer
  include JSONAPI::Serializer
  
  set_type :recipes
  set_id :id 

  attributes :title, :url, :country, :image
end