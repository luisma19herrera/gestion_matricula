class VolantesController < ApplicationController
  before_action :set_volante, only: [:show, :edit, :update, :destroy]

  # GET /volantes
  # GET /volantes.json
  def index
    @volantes = Volante.all
  end

  # GET /volantes/1
  # GET /volantes/1.json
  def show
    request.format = "pdf"
    respond_to do |format|
      format.pdf do
        render pdf: "file_name",   # Excluding ".pdf" extension.
        layout: 'layouts/fpago.html.erb',  # layout used
        show_as_html: params[:debug].present?,
        target: "_blank"
      end
    end
  end

  # GET /volantes/new
  def new
    @volante = Volante.new
  end

  # GET /volantes/1/edit
  def edit
     
  end

  # POST /volantes
  # POST /volantes.json
  def create
    @volante = Volante.new(volante_params)
    
    @volante.f_generacion =Date.current.to_s

    @estudiante = Estudiante.find(@volante.estudiante_id)

    if @volante.concepto=="PAGO INSCRIPCION"
      @estudiante.update_attributes({
         :estado => "Pre Inscrito"
         
      });
    else
      @estudiante.update_attributes({
         :estado => "Pre Matriculado"
         
      });
    end

    respond_to do |format|
      if @volante.save
        format.html { redirect_to @volante, notice: 'Volante creado exitosamente' }
        format.json { render :show, status: :created, location: @volante }
      else
        format.html { render :new }
        format.json { render json: @volante.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /volantes/1
  # PATCH/PUT /volantes/1.json
  def update
    @estudiante = Estudiante.find(@volante.estudiante.id)
      @volante.f_ingreso = Date.current.to_s
      

      @fecha = Horario.random
      @soporte = params[:soporte]

      fecha_hora = "#{@fecha.fecha} #{@fecha.hora_inicio} - #{@fecha.hora_fin}" 
      
      if @volante.concepto == "PAGO INSCRIPCION" && @volante.estudiante.estado == "Pre Inscrito"
      @estudiante.update_attributes({
         :estado => "Inscrito"
         
      });
      else
        if @volante.concepto == "PAGO MATRICULA" && @volante.estudiante.estado == "Matriculado"
          @estudiante.update_attributes({
             :estado => "Pendiente por firma",   
             :f_matricula  => fecha_hora
          });
        end
      end
    respond_to do |format|
      if @volante.update(volante_params)
        format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Volante actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @volante }
      else
        format.html { render :edit }
        format.json { render json: @volante.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /volantes/1
  # DELETE /volantes/1.json
  def destroy
    @volante.destroy
    respond_to do |format|
      format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Volante eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_volante
      @volante = Volante.find(params[:id])
      
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def volante_params
      params.require(:volante).permit(:concepto, :valor, :f_generacion, :f_ingreso, :numero_comprobante, :estudiante_id, :id, :soporte)
    end

end
