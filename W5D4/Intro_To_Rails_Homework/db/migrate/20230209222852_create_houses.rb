class CreateHouses < ActiveRecord::Migration[7.0]
  def change
    create_table :houses do |t|
      t.string, :address, null: false
      t.timestamps
    end

    add_index :houses, :address, unique: true
  end
end
