class AcupuncturesController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  

  def index
    
    @acupunctures = Acupuncture.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @acupunctures }
    end
  end

  def show
    @acupuncture = Acupuncture.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @acupuncture }
    end
  end


  def new
    @admin = current_admin
    @acupuncture = Acupuncture.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @acupuncture }
    end
  end


  def edit
    @acupuncture = Acupuncture.find_by_permalink(params[:id])
  end


  def create
    @acupuncture = Acupuncture.new(params[:acupuncture])

    respond_to do |format|
      if @acupuncture.save
        format.html { redirect_to @acupuncture, notice: 'Article was successfully created.' }
        format.json { render json: @acupuncture, status: :created, location: @acupuncture }
      else
        format.html { render action: "new" }
        format.json { render json: @acupuncture.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @acupuncture = Acupuncture.find_by_permalink(params[:id])

    respond_to do |format|
      if @acupuncture.update_attributes(params[:acupuncture])
        format.html { redirect_to @acupuncture, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @acupuncture.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @acupuncture = Acupuncture.find_by_permalink(params[:id])
    @acupuncture.destroy

    respond_to do |format|
      format.html { redirect_to acupunctures_url }
      format.json { head :no_content }
    end
  end
end
