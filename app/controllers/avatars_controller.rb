class AvatarsController < ApplicationController
  before_action :set_avatar, only: [:destroy]

  def index
    @avatars = current_user.avatars
  end

  def new
    @avatar = current_user.avatars.new
  end

  def create
    # FIXME_AB: redo using nested attributes, forms and possibly form builder for multiple image upload forms
    debugger
    @avatar = current_user.avatars.new(avatar_params)
    if @avatar.save
      redirect_to user_path(current_user), notice: 'Avatar was successfully created.'
    else
      redirect_to :back
    end
  end

  def destroy
    @avatar.destroy
    redirect_to user_avatars_path, notice: 'Avatar was successfully destroyed.'
  end

  private
    def set_avatar
      @avatar = Avatar.find(params[:id])
    end

    def avatar_params
      params.require(:avatar).permit(:image)
    end
end
