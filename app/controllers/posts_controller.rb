class PostsController < ApplicationController

  def index
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def update

  end

  def create
    post = Post.new(create_params)
    post.save
    render json: post
  end

  def show
    render json: Post.find(params[:id])
  end

  def create_params
    params.require(:post).permit(:name, :message, :title)
  end

end
