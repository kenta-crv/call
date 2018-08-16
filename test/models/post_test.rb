# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  company    :string
#  owner      :string
#  tel        :string
#  address    :string
#  people     :string
#  status     :string
#  datetime   :string
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
