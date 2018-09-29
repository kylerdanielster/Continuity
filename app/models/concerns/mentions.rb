module Mentions
  extend ActiveSupport::Concern

  def mentions(field)
    @mentions ||= begin
      regex = /@([\w]+)/
      field.to_s.scan(regex).flatten
    end
  end

  def mentioned_users(field)
    @mentioned_users ||= User.where(username: mentions(field))
  end
end