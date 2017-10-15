class User < ApplicationRecord
  validates :name, :email, :hashed_password, presence: true
  validates :email, uniqueness: true
  has_many :posts

  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    return nil if new_password == ""
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(email, given_password)
    user = User.find_by_email(email)
    return nil if user == nil
    if user.password == given_password
      return user
    else
      return nil
    end
  end
end
