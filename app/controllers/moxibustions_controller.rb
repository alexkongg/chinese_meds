class MoxibustionsController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  

  def index
    
    @moxibustions = Moxibustion.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @moxibustions }
    end
  end

  def show
    @moxibustion = Moxibustion.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @moxibustion }
    end
  end


  def new
    @admin = current_admin
    @moxibustion = Moxibustion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @moxibustion }
    end
  end


  def edit
    @moxibustion = Moxibustion.find_by_permalink(params[:id])
  end


  def create
    @moxibustion = Moxibustion.new(params[:moxibustion])

    respond_to do |format|
      if @moxibustion.save
        format.html { redirect_to @moxibustion, notice: 'Article was successfully created.' }
        format.json { render json: @moxibustion, status: :created, location: @moxibustion }
      else
        format.html { render action: "new" }
        format.json { render json: @moxibustion.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @moxibustion = Moxibustion.find_by_permalink(params[:id])

    respond_to do |format|
      if @moxibustion.update_attributes(params[:moxibustion])
        format.html { redirect_to @moxibustion, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @moxibustion.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @moxibustion = Moxibustion.find_by_permalink(params[:id])
    @moxibustion.destroy

    respond_to do |format|
      format.html { redirect_to moxibustions_url }
      format.json { head :no_content }
    end
  end
end
