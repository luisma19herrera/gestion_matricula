class AcudientesController < ApplicationController
  before_action :set_acudiente, only: [:show, :edit, :update, :destroy]
  protect_from_forgery with: :exception
  

  # GET /acudientes
  # GET /acudientes.json
  def index
    @acudientes = Acudiente.all
  end

  # GET /acudientes/1
  # GET /acudientes/1.json
  def show
  end

  # GET /acudientes/new
  def new
    @acudiente = Acudiente.new
  end

  # GET /acudientes/1/edit
  def edit
  end

  # POST /acudientes
  # POST /acudientes.json
  def create
    @acudiente = Acudiente.new(acudiente_params)

    respond_to do |format|
      if @acudiente.save
        format.html { redirect_to @acudiente, notice: 'Acudiente was successfully created.' }
        format.json { render :show, status: :created, location: @acudiente }
      else
        format.html { render :new }
        format.json { render json: @acudiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /acudientes/1
  # PATCH/PUT /acudientes/1.json
  def update
    respond_to do |format|
      if @acudiente.update(acudiente_params)
        format.html { redirect_to @acudiente, notice: 'Acudiente was successfully updated.' }
        format.json { render :show, status: :ok, location: @acudiente }
      else
        format.html { render :edit }
        format.json { render json: @acudiente.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acudientes/1
  # DELETE /acudientes/1.json
  def destroy
    @acudiente.destroy
    respond_to do |format|
      format.html { redirect_to acudientes_url, notice: 'Acudiente was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_acudiente
      @acudiente = Acudiente.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def acudiente_params
      params.require(:acudiente).permit(:nombre, :apellidos, :identificacion, :ocupacion, :cargo, :empresa, :direccion, :telefono, :celular)
    end

   
end
