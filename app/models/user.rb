class User < ActiveRecord::Base
  has_secure_password

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    # puts "self.password_digest (#{self.password_digest} ==? password (#{password})"
    # puts self.password_digest
    BCrypt::Password.new(self.password_digest) == password
  end

  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :favorites
  has_many :followers
  has_many :posts, foreign_key: 'author_id'
  has_one :profile

  scope :new_users, -> {
    where('created_at between ? and ?',Time.now-1.day,Time.now)
  }
  
end
