class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to check_profile_mypage_profile_path(@user)
    end
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to check_profile_mypage_profile_path(@user)
    end
  end

  private

  def set_user
    @user = User.find(params[:follower])
  end
end
