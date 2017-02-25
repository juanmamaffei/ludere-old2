require 'test_helper'

class GruposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @grupo = grupos(:one)
  end

  test "should get index" do
    get grupos_url
    assert_response :success
  end

  test "should get new" do
    get new_grupo_url
    assert_response :success
  end

  test "should create grupo" do
    assert_difference('Grupo.count') do
      post grupos_url, params: { grupo: { abierto: @grupo.abierto, administradores: @grupo.administradores, descripcion: @grupo.descripcion, integrantes: @grupo.integrantes, misiones: @grupo.misiones, nombre: @grupo.nombre } }
    end

    assert_redirected_to grupo_url(Grupo.last)
  end

  test "should show grupo" do
    get grupo_url(@grupo)
    assert_response :success
  end

  test "should get edit" do
    get edit_grupo_url(@grupo)
    assert_response :success
  end

  test "should update grupo" do
    patch grupo_url(@grupo), params: { grupo: { abierto: @grupo.abierto, administradores: @grupo.administradores, descripcion: @grupo.descripcion, integrantes: @grupo.integrantes, misiones: @grupo.misiones, nombre: @grupo.nombre } }
    assert_redirected_to grupo_url(@grupo)
  end

  test "should destroy grupo" do
    assert_difference('Grupo.count', -1) do
      delete grupo_url(@grupo)
    end

    assert_redirected_to grupos_url
  end
end
