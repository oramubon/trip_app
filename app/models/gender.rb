class Gender < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'man' },
    { id: 3, name: 'woman' },
  ]
  
  include ActiveHash::Associations
  has_many :users
end