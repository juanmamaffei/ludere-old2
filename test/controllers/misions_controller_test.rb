require 'test_helper'

class MisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mision = misions(:one)
  end

  test "should get index" do
    get misions_url
    assert_response :success
  end

  test "should get new" do
    get new_mision_url
    assert_response :success
  end

  test "should create mision" do
    assert_difference('Mision.count') do
      post misions_url, params: { mision: { comentario: @mision.comentario, descripcion: @mision.descripcion, habilitado: @mision.habilitado, nivel: @mision.nivel, nombre: @mision.nombre, urlimagen: @mision.urlimagen, urltemario: @mision.urltemario, visible: @mision.visible } }
    end

    assert_redirected_to mision_url(Mision.last)
  end

  test "should show mision" do
    get mision_url(@mision)
    assert_response :success
  end

  test "should get edit" do
    get edit_mision_url(@mision)
    assert_response :success
  end

  test "should update mision" do
    patch mision_url(@mision), params: { mision: { comentario: @mision.comentario, descripcion: @mision.descripcion, habilitado: @mision.habilitado, nivel: @mision.nivel, nombre: @mision.nombre, urlimagen: @mision.urlimagen, urltemario: @mision.urltemario, visible: @mision.visible } }
    assert_redirected_to mision_url(@mision)
  end

  test "should destroy mision" do
    assert_difference('Mision.count', -1) do
      delete mision_url(@mision)
    end

    assert_redirected_to misions_url
  end
end
