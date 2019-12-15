class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :password, :movies 
end
