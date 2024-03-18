class UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :create]
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
    password_confirmation: params[:password_confirmation]
  )
    render :show
  end

  def update
    @user = User.find_by(id: params[:id])
    if current_user.id == @user.id
      if params[:password].present? && password_confirmation.present?
        @user.update(
        firstName: params[:firstName] || @user.firstName,
        lastName: params[:lastName] || @user.lastName,
        image: params[:image] || @user.image,
        email: params[:email] || @user.email,
        password: params[:password] || @user.password,
        password_confirmation: params[:password_confirmation] || @user.password_confirmation
      )
      else
        @user.update(
          firstName: params[:firstName] || @user.firstName,
          lastName: params[:lastName] || @user.lastName,
          image: params[:image] || @user.image,
          email: params[:email] || @user.email
        )
      end
      render :show
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    if current_user.id == @user.id
      @user.destroy
      render json:{message: "user deleted"}
    else
      render json:{message: "Login to update account"}
    end
  end

end
