# frozen_string_literal: true

class RelationshipsController < ApplicationController
  before_action :set_user

  def create
    following = current_user.follow(@user)
    if following.save
      flash.now[:success] = 'ユーザーのフォローしました'
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
    end
    redirect_to check_profile_mypage_profile_path(@user)
  end

  def destroy
    following = current_user.unfollow(@user)
    if following.destroy
      flash.now[:success] = 'ユーザーのフォロー解除しました'
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
    end
    redirect_to check_profile_mypage_profile_path(@user)
  end

  private

  def set_user
    @user = User.find(params[:follower])
  end
end
