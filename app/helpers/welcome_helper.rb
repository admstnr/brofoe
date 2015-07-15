module WelcomeHelper 

  def post_printer
    Post.where(parent: nil).last(4).each do |post|
      post_printer_do post
    end
  end

  def post_printer_do post, indent=0
    @content = ""
    # content_tag( :div ) {
    #   concat content_tag :span, "something", class: :topic 
    #   concat content_tag( :span, class: :topic ) {
    #     concat post.author.handle << " wrote something."
    #   }
    # }

    concat( content_tag( :span, class: :indents ) {
      for i in 0...indent
        concat( tag :span, class: :indent )
      end
    })
    concat(content_tag( :span, class: :author ) {
      concat( link_to post.author.handle, user_path(post.author) )
      concat( tag :br )
    }) 
    # content_tag :span, {
    #   for i in 0...indent
    #     tag :span, class: "indent"
    #   end
    # }, class: "indents"
    # content_tag span, {
    #   link_to post.author.handle, user_path(post.author)
    # }, class: "author"
    # content_tag :span, post.body, class: "quote"
    # post.topics.each do | topic | 
    #   content_tag :span, {
    #       link_to topic.name, topic_path(topic)
    #     }, class: "topic"
    # end

 # <span class="indents"><span class="indent"></span><% end %><!--
 #  --></span><span class="author">@<%=  %></span>:
 #  <span class="quote"><%= post.body %></span>
 #  <% post.topics.each do | topic | %>
 #    <span class="topic">#<%= link_to topic.name, topic_path(topic) %></span> 
 #  <% end %>
 #  <% if post.favorites.length > 0 %><i class="fa fa-heart"></i><% end %>
 #  <% post.favorites.last(3).each_with_index do | favorite, i | %>
 #    <span class="favorite"><%= link_to favorite.user.handle, user_path(favorite.user) %></span><%= ", " if i < post.favorites.last(3).length-1 %>
 #  <% end %>
 #  <br />
 #  <% post.sub_posts.each {|sub_post| flush_post(sub_post, indent+1) } %>
   end 
end
