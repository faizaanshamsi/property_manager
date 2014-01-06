class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :name, null: false
      t.string :street_address, null: false
      t.string :city, null: false
      t.string :postal_code, null: false
      t.string :state, null: false
      t.text :description

      t.timestamps
    end
  end
end
