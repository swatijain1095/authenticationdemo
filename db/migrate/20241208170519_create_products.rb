class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.string :sku

      t.timestamps
    end
  end
end
