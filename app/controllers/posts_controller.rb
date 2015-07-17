class PostsController < ApplicationController
   
  def new
    @post = Post.new
  end
  def create
    @post = Post.new( post_params.merge( { author_id: current_user.id } ) )
    puts @post
    if @post.save
      #redirect_to @post
      respond_to do |format|
        format.js
      end
    else
      render 'new'
    end

  end
  def show
    @post = Post.find(params[:id])
  end


  private
    def post_params
      params.require(:post).permit(:author_id, :parent_id, :body, :status)
    end
end
