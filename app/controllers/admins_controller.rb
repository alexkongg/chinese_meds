class AdminsController < ApplicationController
  def new
    @admin = Admin.new(params[:admin])
    if @admin.save
      flash[:success] = "Welcome #{@admin.name}!"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
