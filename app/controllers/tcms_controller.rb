class TcmsController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  

  def index
    
    @tcms = Tcm.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tcms }
    end
  end

  def show
    @tcm = Tcm.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tcm }
    end
  end


  def new
    @admin = current_admin
    @tcm = Tcm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tcm }
    end
  end


  def edit
    @tcm = Tcm.find_by_permalink(params[:id])
  end


  def create
    @tcm = Tcm.new(params[:tcm])

    respond_to do |format|
      if @tcm.save
        format.html { redirect_to @tcm, notice: 'Article was successfully created.' }
        format.json { render json: @tcm, status: :created, location: @tcm }
      else
        format.html { render action: "new" }
        format.json { render json: @tcm.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @tcm = Tcm.find_by_permalink(params[:id])

    respond_to do |format|
      if @tcm.update_attributes(params[:tcm])
        format.html { redirect_to @tcm, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tcm.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @tcm = Tcm.find_by_permalink(params[:id])
    @tcm.destroy

    respond_to do |format|
      format.html { redirect_to tcms_url }
      format.json { head :no_content }
    end
  end
end
