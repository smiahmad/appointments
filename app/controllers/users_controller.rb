class UsersController < ApplicationController
  def my_gate_appointments
    @my_gate_appointments = current_user.gate_appointments
    @user=current_user
  end

  def show
    @user = User.find(params[:id])
    @my_gate_appointments = @user.gate_appointments
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      # byebug
      if @friends
        respond_to do |format|
          format.js{render partial: 'users/friend_result'}
        end
      else
        respond_to do |format|
        flash.now[:alert] = "Could not find friend!"
        format.js{render partial: 'users/friend_result'}
        end
      end
    else
      respond_to do |format|
      flash.now[:alert] = "Please enter a friend name or email to search"
      format.js{render partial: 'users/friend_result'}
      end
    end
  end
end
