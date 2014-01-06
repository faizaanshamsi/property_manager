class AddOwnerToBuilding < ActiveRecord::Migration
  def up
    add_column :buildings, :owner_id, :integer
  end

  def down
    remove_column :buildings, :owner_id
  end
end
