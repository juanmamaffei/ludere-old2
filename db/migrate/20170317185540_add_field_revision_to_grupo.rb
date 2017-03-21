class AddFieldRevisionToGrupo < ActiveRecord::Migration[5.0]
  def change
  	add_column :grupos, :revision, :text
  end
end
