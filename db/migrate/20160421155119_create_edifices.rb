class CreateEdifices < ActiveRecord::Migration
  def change
    create_table :edifices do |t|
      t.string :name
      t.integer :sustainability_level
      t.date :last_update_of_sustainability_level

      t.timestamps null: false
    end
  end
end
