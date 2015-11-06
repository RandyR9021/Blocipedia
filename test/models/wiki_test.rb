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

require 'test_helper'

class WikiTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
