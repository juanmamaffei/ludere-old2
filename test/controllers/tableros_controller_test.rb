require 'test_helper'

class TablerosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tablero = tableros(:one)
  end

  test "should get index" do
    get tableros_url
    assert_response :success
  end

  test "should get new" do
    get new_tablero_url
    assert_response :success
  end

  test "should create tablero" do
    assert_difference('Tablero.count') do
      post tableros_url, params: { tablero: { abierto: @tablero.abierto, cronometro: @tablero.cronometro, descripcion: @tablero.descripcion, e1: @tablero.e1, e2: @tablero.e2, e3: @tablero.e3, horafin: @tablero.horafin, horainicio: @tablero.horainicio, miembros: @tablero.miembros, nombre: @tablero.nombre, puntos: @tablero.puntos } }
    end

    assert_redirected_to tablero_url(Tablero.last)
  end

  test "should show tablero" do
    get tablero_url(@tablero)
    assert_response :success
  end

  test "should get edit" do
    get edit_tablero_url(@tablero)
    assert_response :success
  end

  test "should update tablero" do
    patch tablero_url(@tablero), params: { tablero: { abierto: @tablero.abierto, cronometro: @tablero.cronometro, descripcion: @tablero.descripcion, e1: @tablero.e1, e2: @tablero.e2, e3: @tablero.e3, horafin: @tablero.horafin, horainicio: @tablero.horainicio, miembros: @tablero.miembros, nombre: @tablero.nombre, puntos: @tablero.puntos } }
    assert_redirected_to tablero_url(@tablero)
  end

  test "should destroy tablero" do
    assert_difference('Tablero.count', -1) do
      delete tablero_url(@tablero)
    end

    assert_redirected_to tableros_url
  end
end
