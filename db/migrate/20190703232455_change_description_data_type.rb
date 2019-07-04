class ChangeDescriptionDataType < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :description, :text
    change_column :products, :price, :decimal, :precision => 7, :scale => 2
  end
end
