class TreatmentsController < ApplicationController
  def index
    @treatments = Treatment.all
    @hospital = Hospital.find(params[:hospital_id])
  end

  def new
    @treatment = Treatment.new
  end

  def create
    @treatment = Treatment.new(params.require(:treatment).permit(:name, :price))
    respond_to do |format|
      if @treatment.save
        format.html { redirect_to hospital_treatments_path, notice: 'Your project is now live.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @treatment = Treatment.find(params[:id])
  end

  def update
    @treatment = Treatment.find(params[:id])
    respond_to do |format|
      if @treatment.update(params.require(:treatment).permit(:name, :price))
        format.html { redirect_to hospital_treatments_path, notice: 'The record successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def show
    @treatment  = Treatment.find(params[:id])

    # @bugs=Bug.all
  end

  def destroy
    @treatment  = Treatment.find(params[:id])
    # Destroy/delete the record
    @treatment.destroy

    # Redirect
    respond_to do |format|
      format.html { redirect_to hospital_treatments_path, notice: 'Record was removed.' }
    end
  end

  #   def hospital_treatment
  #     HospitalTreatment.create!(hospital_id: params[:hospital_id], treatment_id: params[:treatment_id],
  #                               doctor_id: params[:user_id])
  #     debugger
  #     @treatment = Treatment.find(params[:treatment_id])
  #     @hospital = @treatment.hospitals
  #   end
end
