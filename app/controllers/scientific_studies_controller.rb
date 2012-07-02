class ScientificStudiesController < ApplicationController
  before_filter :signed_in_admin, only: [:destroy, :edit, :update]
  
  

  def index
    
    @scientific_studies = ScientificStudy.paginate(page: params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @scientific_studies }
    end
  end

  def show
    @scientific_study = ScientificStudy.find_by_permalink(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @scientific_study }
    end
  end


  def new
    @admin = current_admin
    @scientific_study = ScientificStudy.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @scientific_study }
    end
  end


  def edit
    @scientific_study = ScientificStudy.find_by_permalink(params[:id])
  end


  def create
    @scientific_study = ScientificStudy.new(params[:scientific_study])

    respond_to do |format|
      if @scientific_study.save
        format.html { redirect_to @scientific_study, notice: 'Article was successfully created.' }
        format.json { render json: @scientific_study, status: :created, location: @scientific_study }
      else
        format.html { render action: "new" }
        format.json { render json: @scientific_study.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    @scientific_study = ScientificStudy.find_by_permalink(params[:id])

    respond_to do |format|
      if @scientific_study.update_attributes(params[:scientific_study])
        format.html { redirect_to @scientific_study, notice: 'Article was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @scientific_study.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @scientific_study = ScientificStudy.find_by_permalink(params[:id])
    @scientific_study.destroy

    respond_to do |format|
      format.html { redirect_to scientific_studies_url }
      format.json { head :no_content }
    end
  end
end
