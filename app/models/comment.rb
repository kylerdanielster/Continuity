# == Schema Information
#
# Table name: comments
#
#  id         :bigint(8)        not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id  :integer
#  user_id    :integer
#

class Comment < ApplicationRecord
  include Mentions

  belongs_to :answer
  belongs_to :user
end
