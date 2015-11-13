# == Schema Information
#
# Table name: wikis
#
#  id          :integer          not null, primary key
#  title       :string
#  body        :text
#  private     :boolean
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

class Wiki < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :collaborators
  scope :visible_to, ->(user, viewable = false) { user ? all : where(private: viewable) }
end
