class Wiki < ActiveRecord::Base
  belongs_to :user
  belongs_to :category_id
  has_many :collaborators
end
