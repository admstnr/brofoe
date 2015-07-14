class Post < ActiveRecord::Base
  belongs_to :author, class_name: 'User' #, foreign_key: 'author_id'
  has_many :favorites
  has_many :post_topics
  has_many :topics, through: :post_topics
  has_many :sub_posts, class_name: 'Post', foreign_key: 'parent_id'
  belongs_to :parent, class_name: 'Post' #, foreign_key: 'parent_id'

  scope :is_popular, -> {
    joins(:favorites).group(:posts).having("COUNT(*) > 3")
  }
end
