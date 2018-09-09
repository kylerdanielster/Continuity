# == Schema Information
#
# Table name: chatrooms
#
#  id                 :bigint(8)        not null, primary key
#  name               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  question_thread_id :integer
#

class Chatroom < ApplicationRecord
  has_many :chatroom_users
  has_many :users, through: :chatroom_users
  has_many :messages

  belongs_to :question_thread
end
