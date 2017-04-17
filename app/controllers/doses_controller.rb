class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create]


  def index
  end


  def show
  end

  # GET /doses/new
  def new
    @dose = Dose.new
  end

  # GET /doses/1/edit
  def edit
  end

  # POST /doses
  # POST /doses.json
  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail

    respond_to do |format|
      if @dose.save
        format.html { redirect_to cocktail_path(@cocktail.id), notice: 'Dose was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /doses/1
  # PATCH/PUT /doses/1.json
  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to @dose, notice: 'Dose was successfully updated.' }
        format.json { render :show, status: :ok, location: @dose }
      else
        format.html { render :edit }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doses/1
  # DELETE /doses/1.json
  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail_id)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dose
      @cocktail = Cocktail.find(params[:cocktail_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dose_params
      params.require(:dose).permit(:description, :ingredient_id)
    end
end
