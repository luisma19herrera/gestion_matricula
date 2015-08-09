require 'test_helper'

class EstudiantesControllerTest < ActionController::TestCase
  setup do
    @estudiante = estudiantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:estudiantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create estudiante" do
    assert_difference('Estudiante.count') do
      post :create, estudiante: { acudiente_id: @estudiante.acudiente_id, apellidos: @estudiante.apellidos, doc_identidad: @estudiante.doc_identidad, edad: @estudiante.edad, estado: @estudiante.estado, f_examen: @estudiante.f_examen, f_matricula: @estudiante.f_matricula, f_nacimiento: @estudiante.f_nacimiento, grado: @estudiante.grado, grado_aspirado: @estudiante.grado_aspirado, institucion_anterior: @estudiante.institucion_anterior, lugar_expedicion: @estudiante.lugar_expedicion, nombre: @estudiante.nombre }
    end

    assert_redirected_to estudiante_path(assigns(:estudiante))
  end

  test "should show estudiante" do
    get :show, id: @estudiante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @estudiante
    assert_response :success
  end

  test "should update estudiante" do
    patch :update, id: @estudiante, estudiante: { acudiente_id: @estudiante.acudiente_id, apellidos: @estudiante.apellidos, doc_identidad: @estudiante.doc_identidad, edad: @estudiante.edad, estado: @estudiante.estado, f_examen: @estudiante.f_examen, f_matricula: @estudiante.f_matricula, f_nacimiento: @estudiante.f_nacimiento, grado: @estudiante.grado, grado_aspirado: @estudiante.grado_aspirado, institucion_anterior: @estudiante.institucion_anterior, lugar_expedicion: @estudiante.lugar_expedicion, nombre: @estudiante.nombre }
    assert_redirected_to estudiante_path(assigns(:estudiante))
  end

  test "should destroy estudiante" do
    assert_difference('Estudiante.count', -1) do
      delete :destroy, id: @estudiante
    end

    assert_redirected_to estudiantes_path
  end
end
