class HospitalsController < ApplicationController
  def index
    @hospitals = Hospital.all
  end

  def new
    @hospital = Hospital.new
  end

  def create
    @hospital = Hospital.new(params.require(:hospital).permit(:name, :city, :address))

    respond_to do |format|
      if @hospital.save
        format.html { redirect_to hospitals_path, notice: 'Your hospital is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @hospital = Hospital.find(params[:id])
  end

  def update
    @hospital = Hospital.find(params[:id])
    respond_to do |format|
      if @hospital.update(params.require(:hospital).permit(:name, :city, :address))
        format.html { redirect_to hospitals_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @hospital = Hospital.find(params[:id])
    # @bugs = Bug.all.where(project_id: @project.id)
  end

  def destroy
    @hospital = Hospital.find(params[:id])

    @hospital.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to hospitals_path, notice: 'Record was removed.' }
    end
  end
end
