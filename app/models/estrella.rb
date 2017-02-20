class Estrella < ApplicationRecord
  belongs_to :idusuario
  belongs_to :idobjetivo
  # Agregar validación de unicidad del doble índice (objetivo, usuario)
end
