class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def create
    @user = User.create(
    firstName: params[:firstName],
    lastName: params[:lastName],
    image: params[:image],
    email: params[:email],
    password: params[:password],
    password_confirmation: params[:password_confirmation],
  )
    render :show
  end

  def update
    @user = User.create(
    firstName: params[:firstName] || @user.firstName,
    lastName: params[:lastName] || @user.lastName,
    image: params[:image] || @user.image,
    email: params[:email] || @user.email,
    password: params[:password] || @user.password,
    password_confirmation: params[:password_confirmation] || @user.password_confirmation,
  )
    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    render json:{message: "user deleted"}
  end
end
