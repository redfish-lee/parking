class CreateParks < ActiveRecord::Migration
  def change
    create_table :parks do |t|
      t.string :name
      t.integer :floor
      t.integer :number
      t.string :phone

      t.timestamps null: false
    end
  end
end
