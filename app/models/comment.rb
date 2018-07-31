# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  answer_id  :integer
#  user_id    :integer
#

class Comment < ApplicationRecord
  belongs_to :question_answer
  belongs_to :user
end
