class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :ensure_anonymous, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    @avatar = current_user.avatars.new
    # FIXME_AB: fix so that user can choose an image from his currenty uploaded images
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to home_path, notice: "Hi #{ @user.first_name }, your account was successfully created." 
    else
      render :new
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
