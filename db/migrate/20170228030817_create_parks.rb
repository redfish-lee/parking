class CreateParks < ActiveRecord::Migration[5.0]
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :floor
      t.integer :number
      t.string :phone

      t.timestamps
    end
  end
end
