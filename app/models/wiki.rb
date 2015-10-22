class Wiki < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :collaborators
end
