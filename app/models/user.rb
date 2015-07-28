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

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  scope :new_users, -> {
    where('created_at between ? and ?',Time.now-1.day,Time.now)
  }
  
end
