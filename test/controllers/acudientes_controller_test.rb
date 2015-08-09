require 'test_helper'

class AcudientesControllerTest < ActionController::TestCase
  setup do
    @acudiente = acudientes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:acudientes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create acudiente" do
    assert_difference('Acudiente.count') do
      post :create, acudiente: { apellidos: @acudiente.apellidos, cargo: @acudiente.cargo, celular: @acudiente.celular, direccion: @acudiente.direccion, empresa: @acudiente.empresa, identificacion: @acudiente.identificacion, nombre: @acudiente.nombre, ocupacion: @acudiente.ocupacion, telefono: @acudiente.telefono }
    end

    assert_redirected_to acudiente_path(assigns(:acudiente))
  end

  test "should show acudiente" do
    get :show, id: @acudiente
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @acudiente
    assert_response :success
  end

  test "should update acudiente" do
    patch :update, id: @acudiente, acudiente: { apellidos: @acudiente.apellidos, cargo: @acudiente.cargo, celular: @acudiente.celular, direccion: @acudiente.direccion, empresa: @acudiente.empresa, identificacion: @acudiente.identificacion, nombre: @acudiente.nombre, ocupacion: @acudiente.ocupacion, telefono: @acudiente.telefono }
    assert_redirected_to acudiente_path(assigns(:acudiente))
  end

  test "should destroy acudiente" do
    assert_difference('Acudiente.count', -1) do
      delete :destroy, id: @acudiente
    end

    assert_redirected_to acudientes_path
  end
end
