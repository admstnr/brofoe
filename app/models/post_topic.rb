class PostTopic < ActiveRecord::Base
  belongs_to :post
  belongs_to :topic

#  self.table_name = "posts_topics"
end