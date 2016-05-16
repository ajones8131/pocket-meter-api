# app/controllers/users_controller.rb

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  #index
  def index
    @users = User.all

    render json:@users
  end

  #show
  def show
    render json: @user
  end

  #create
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #update
  def update
    if @user.update(user_params)
      head :no_content
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  #destroy
  def destroy
    @user.destroy
    head :no_content
  end

  #private
  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username)
    end
end
