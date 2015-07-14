# #Associations
# User
# has_many :users_groups
# has_many :groups, through: :users_groups
# has_many :favorites
# has_many :followers
# has_many :posts
# has_one :profile

# Post
# belongs_to :author, class_name: 'User' #, foreign_key: 'author_id'
# has_many :favorites
# has_many :posts_topics
# has_many :topics, through: :posts_topics
# has_many :posts
# belongs_to :parent, class_name: 'Post' #, foreign_key: 'parent_id'

# PostTopic
# belongs_to :post
# belongs_to :topic

# Topic
# has_many :posts_topics
# has_many :posts, through :posts_topics

# Follower
# belongs_to :user
# belongs_to :follower, class_name: 'User' #, foreign_key: 'follower_id'

# Group
# has_many :users_groups
# has_many :users, through: :users_groups

# UserGroup
# belongs_to :user
# belongs_to :group

# Favorite
# belongs_to :user
# belongs_to :post

# Profile
# belongs_to :user


User.create( id: 1, first_name: "Cam", last_name: "Crews", handle: "Camerican", email: "cam@nycda.com", password_digest: "sample")
User.create( id: 2, first_name: "Constance", last_name: "Ip", handle: "IpsoFacto", email: "constance@nycda.com", password_digest: "candice")
User.create( id: 3, first_name: "Mike", last_name: "Harvey", handle: "Mike", email: "michaelharvey17@gmail.com", password_digest: "sample")
User.create( id: 4, first_name: "Berlin", last_name: "Patience", handle: "Berlin", email: "starsberlin@gmail.com", password_digest: "sample")
User.create( id: 5, first_name: "Jeff", last_name: "Bowne", handle: "Jeff", email: "jeffbowne@hotmail.com", password_digest: "sample")
User.create( id: 6, first_name: "Jake", last_name: "Smergel", handle: "Jake", email: "jacob.smergel@gmail.com", password_digest: "sample")
User.create( id: 7, first_name: "Chris", last_name: "Duane", handle: "DuanesWorld", email: "cduane21@gmail.com", password_digest: "sample")
User.create( id: 8, first_name: "Will", last_name: "Bolton", handle: "Will", email: "william.ellet@gmail.com", password_digest: "sample")
User.create( id: 9, first_name: "Patrick", last_name: "Keenan", handle: "Patrick", email: "pgk4526@gmail.com", password_digest: "sample")
User.create( id: 10, first_name: "David", last_name: "Toomey", handle: "David", email: "d.toomey@temple.edu", password_digest: "sample")
User.create( id: 11, first_name: "Azeez", last_name: "Azeez", handle: "Elder", email: "elderazeez20@gmail.com", password_digest: "sample")

Post.create( id: 1, author_id: 1, body: "bro" )
Post.create( id: 2, author_id: 2, body: "hey" )
Post.create( id: 3, author_id: 3, body: "Me" )
Post.create( id: 4, author_id: 4, body: "Ber" )

Post.create( id: 5, author_id: 1, parent_id: 2, body: "sis" )
Post.create( id: 6, author_id: 1, parent_id: 3, body: "bro" )
Post.create( id: 7, author_id: 1, parent_id: 4, body: "sis" )

Post.create( id: 8, author_id: 2, parent_id: 2, body: "sis" )
Post.create( id: 9, author_id: 2, parent_id: 6, body: "bro" )

Post.create( id: 10, author_id: 5, parent_id: 9, body: "bx2" )

Topic.create( id: 1, name: "family" )
Topic.create( id: 2, name: "WDI" )
Topic.create( id: 3, name: "NYCDA")

PostTopic.create( post_id: 1, topic_id: 1 )
PostTopic.create( post_id: 5, topic_id: 1 )
PostTopic.create( post_id: 6, topic_id: 1 )
PostTopic.create( post_id: 7, topic_id: 1 )

Follower.create( user_id: 1, follower_id: 2 )
Follower.create( user_id: 1, follower_id: 3 )
Follower.create( user_id: 1, follower_id: 4 )
Follower.create( user_id: 1, follower_id: 5 )
Follower.create( user_id: 1, follower_id: 6 )
Follower.create( user_id: 1, follower_id: 7 )
Follower.create( user_id: 1, follower_id: 8 )
Follower.create( user_id: 1, follower_id: 9 )
Follower.create( user_id: 1, follower_id: 10 )
Follower.create( user_id: 1, follower_id: 11 )
Follower.create( user_id: 2, follower_id: 1 )
Follower.create( user_id: 2, follower_id: 3 )
Follower.create( user_id: 2, follower_id: 4 )
Follower.create( user_id: 2, follower_id: 5 )
Follower.create( user_id: 2, follower_id: 8 )
Follower.create( user_id: 2, follower_id: 10 )
Follower.create( user_id: 3, follower_id: 5 )
Follower.create( user_id: 5, follower_id: 3 )

Favorite.create( user_id: 1, post_id: 2 )
Favorite.create( user_id: 5, post_id: 1 )
Favorite.create( user_id: 3, post_id: 1 )
Favorite.create( user_id: 10, post_id: 1 )

Profile.create( user_id: 1, l_linkedin: '/in/camcrews', l_github: '/camerican' )
Profile.create( user_id: 2, l_linkedin: '/in/constanceip', l_facebook: '/constance.ip.3', l_twitter: '/c_ip')

Group.create( id: 1, name: "NYCDA" )
Group.create( id: 2, name: "Mets")
Group.create( id: 3, name: "Phillies")
Group.create( id: 4, name: "Soccer")

UserGroup.create( user_id: 1, group_id: 1 )
UserGroup.create( user_id: 1, group_id: 2 )
UserGroup.create( user_id: 1, group_id: 3 )
UserGroup.create( user_id: 1, group_id: 4 )
UserGroup.create( user_id: 2, group_id: 1 )
UserGroup.create( user_id: 3, group_id: 1 )
UserGroup.create( user_id: 4, group_id: 1 )
UserGroup.create( user_id: 5, group_id: 1 )
UserGroup.create( user_id: 6, group_id: 1 )
UserGroup.create( user_id: 7, group_id: 1 )
UserGroup.create( user_id: 8, group_id: 1 )
UserGroup.create( user_id: 9, group_id: 1 )
UserGroup.create( user_id: 10, group_id: 1 )
UserGroup.create( user_id: 11, group_id: 1 )
