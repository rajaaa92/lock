class LockController < ApplicationController
  def unlock
    if Lock.passwords_match?(params[:password])
      session[:lock_opened] = true
      redirect_to root_path
    else
      redirect_to :action=>:login
    end
  end

  def lock
    session.delete :lock_opened
    redirect_to lock_login_path
  end
end
