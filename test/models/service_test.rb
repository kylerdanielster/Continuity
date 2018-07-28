# == Schema Information
#
# Table name: services
#
#  id                  :integer          not null, primary key
#  access_token        :string
#  access_token_secret :string
#  auth                :text
#  expires_at          :datetime
#  provider            :string
#  refresh_token       :string
#  uid                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#
# Indexes
#
#  index_services_on_user_id  (user_id)
#

require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
