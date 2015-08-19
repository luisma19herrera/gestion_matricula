class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :edit, :update, :destroy]

  # GET /documentos
  # GET /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1
  # GET /documentos/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name",   # Excluding ".pdf" extension.
        layout: 'layouts/application.pdf.haml',  # layout used
             show_as_html: params[:debug].present?
      end
    end
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = Documento.new(documento_params)    
    @documento.fecha_ingreso = Date.current.to_s
    @estudiante = Estudiante.find(@documento.estudiante_id)
    @documentos = Documento.all
    contador = 1

    @documentos.each do |doc|
      if doc.estudiante_id == @documento.estudiante_id && doc.tipo_documento == "Boletin"
        contador = contador + 1
      else
        if doc.estudiante_id == @documento.estudiante_id && doc.tipo_documento == "Documento de identidad"
          contador = contador + 1
        else
          if doc.estudiante_id == @documento.estudiante_id && doc.tipo_documento == "Constancia EPS"
            contador = contador + 1
          else
            if doc.estudiante_id == @documento.estudiante_id && doc.tipo_documento == "Foto tamaño 3x4"
              contador = contador + 1
            end
          end

        end

      end      

      
    end

      @fecha = Horario.random


      fecha_hora = "#{@fecha.fecha} #{@fecha.hora_inicio} - #{@fecha.hora_fin}" 
    if contador==4
      @estudiante.update_attributes({
         :estado => "Pendiente por examen",
         :f_examen  => fecha_hora
      });
    end
    
    respond_to do |format|
      if @documento.save
        format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Documento creado exitosamente' }
        format.json { render :show, status: :created, location: @documento }
      else
        format.html { render :new }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Documento actualizado exitosamente' }
        format.json { render :show, status: :ok, location: @documento }
      else
        format.html { render :edit }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to "http://localhost:3000/estudiantes", notice: 'Documento eliminado exitosamente' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:tipo_documento, :fecha_ingreso, :observacion, :estudiante_id, :adjunto)
    end

    
end
