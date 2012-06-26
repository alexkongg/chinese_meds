class SessionsController < ApplicationController
  
  def create
    admin = Admin.find_by_email(params[:session][:email])
    if admin && admin.authenticate(params[:session][:password])
      sign_in admin
      redirect_to admin
    else
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end
  
  def create
    
  end
  
  def destroy
    
  end
  
  
  
end
