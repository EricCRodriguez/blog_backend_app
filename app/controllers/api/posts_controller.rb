class Api::PostsController < ApplicationController
  def index
    @posts = Post.all
    render "index.json.jb"
  end

  def create
    @post = Post.new(
      title: params[:title],
      body: params[:body],
      image: params[:image],

    )
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    render "show.json.jb"
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.title = params[:title] || @post.title
    @post.body = params[:body] || @post.body
    if @post.save
      render "show.json.jb"
    else
      render json: { errors: @post.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    render json: { message: "Post successfully destroyed!" }
  end
end
