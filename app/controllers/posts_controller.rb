class PostsController < ApplicationController
    # validates :body, presence: true,
    #                 length: { maximum: 3 }
  def new
    @post = Post.new
  end
  def create
    @post = Post.new( post_params )
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  private
    def post_params
      params.require(:post).permit(:author_id, :parent_id, :body, :status)
    end
end
