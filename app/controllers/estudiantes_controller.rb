class EstudiantesController < ApplicationController
  before_action :set_estudiante, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_acudiente!

  # GET /estudiantes
  # GET /estudiantes.json
  def index
    @estudiantes = Estudiante.all
  end

  # GET /estudiantes/1
  # GET /estudiantes/1.json
  def show
  end

  # GET /estudiantes/new
  def new
    @estudiante = Estudiante.new
  end

  # GET /estudiantes/1/edit
  def edit
  end



  # POST /estudiantes
  # POST /estudiantes.json
  def create
    @estudiante = Estudiante.new(estudiante_params)
    @estudiante.estado = "Aspirante"
    @estudiante.acudiente_id = current_acudiente.id

    respond_to do |format|
      if @estudiante.save
        format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Estudiante creado exitosamente' }
        format.json { render :show, status: :created, location: @estudiante }
      else
        format.html { render :new }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /estudiantes/1
  # PATCH/PUT /estudiantes/1.json
  def update
    respond_to do |format|
      if @estudiante.update(estudiante_params)
        format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Estudiante actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @estudiante }
      else
        format.html { render :edit }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  def actualizar
    respond_to do |format|
      if @estudiante.update(estudiante_params)
        format.html { redirect_to "http://localhost:3000/admin/estudiantes", notice: 'Estudiante actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @estudiante }
      else
        format.html { render :edit }
        format.json { render json: @estudiante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /estudiantes/1
  # DELETE /estudiantes/1.json
  def destroy
    @estudiante.destroy
    respond_to do |format|
      format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Estudiante eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_estudiante
      @estudiante = Estudiante.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def estudiante_params
      params.require(:estudiante).permit(:nombre, :apellidos, :edad, :doc_identidad, :lugar_expedicion, :grado, :f_nacimiento, :institucion_anterior, :grado_aspirado, :estado, :acudiente_id, :f_examen, :f_matricula)
    end
end
