class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  #index
  def index
    @comments = Comment.all

    render json:@comments
  end

  #show
  def show
    render json: @comment
  end

  #create
  def create
    @comment = Comment.new(comments_params)

    if @comment.save
      render json: @comment, status: :created, location: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  #update
  def update
    if @comment.update(comments_params)
      head :no_content
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  #destroy
  def destroy
    @comment.destroy
    head :no_content
  end

  #private
  private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comments_params
      params.require(:comment).permit(:username, :description, :rating, :timestamp)
    end
end
