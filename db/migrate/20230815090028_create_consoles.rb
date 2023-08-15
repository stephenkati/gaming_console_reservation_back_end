class CreateConsoles < ActiveRecord::Migration[7.0]
  def change
    create_table :consoles do |t|
      t.string :name
      t.integer :purchase_price
      t.integer :rental_price
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
