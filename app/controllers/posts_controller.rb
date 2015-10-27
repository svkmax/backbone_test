class PostsController < ApplicationController
  before_filter :set_post, only: [:update, :show, :destroy]

  def index
    @posts = Post.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def update
    render @post.update(create_params) ? { json: @post } : { json: @post.reload,
                                                                   status: :unprocessable_entity }
  end

  def create
    post = Post.new(create_params)
    render post.save ? {json: post } : { json: post.errors, status: 422 }
  end

  def show
    render json: @post
  end

  def destroy
    render json: @post.delete ? { status: :ok } : { status: 418 }
  end

  private
  def create_params
    params.require(:post).permit(:name, :message, :title)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
