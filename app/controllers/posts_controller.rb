class PostsController < ApplicationController
  def index
    @posts = Post.all.order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    Pusher['kaqi_channel'].trigger('kaqi_event', {
      message: 'new post', post: @post
    })

    redirect_to post_path(@post)
  end

  private
  def post_params
    params.require(:post).permit(:name)
  end
end
