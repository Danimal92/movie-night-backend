class UsermovieSerializer < ActiveModel::Serializer
  attributes :id, :liked
  has_one :user
  has_one :movie
end
