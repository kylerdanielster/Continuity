# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :string
#  last_sign_in_ip            :string
#  name                       :string
#  announcements_last_read_at :datetime
#  admin                      :boolean          default(FALSE)
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
end
