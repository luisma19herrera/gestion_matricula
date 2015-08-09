require 'test_helper'

class VolantesControllerTest < ActionController::TestCase
  setup do
    @volante = volantes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:volantes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create volante" do
    assert_difference('Volante.count') do
      post :create, volante: { concepto: @volante.concepto, estudiante_id: @volante.estudiante_id, f_generacion: @volante.f_generacion, f_ingreso: @volante.f_ingreso, numero_comprobante: @volante.numero_comprobante, valor: @volante.valor }
    end

    assert_redirected_to volante_path(assigns(:volante))
  end

  test "should show volante" do
    get :show, id: @volante
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @volante
    assert_response :success
  end

  test "should update volante" do
    patch :update, id: @volante, volante: { concepto: @volante.concepto, estudiante_id: @volante.estudiante_id, f_generacion: @volante.f_generacion, f_ingreso: @volante.f_ingreso, numero_comprobante: @volante.numero_comprobante, valor: @volante.valor }
    assert_redirected_to volante_path(assigns(:volante))
  end

  test "should destroy volante" do
    assert_difference('Volante.count', -1) do
      delete :destroy, id: @volante
    end

    assert_redirected_to volantes_path
  end
end
