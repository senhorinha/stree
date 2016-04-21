class CreateEdifices < ActiveRecord::Migration
  def change
    create_table :edifices do |t|
      t.string :name
      t.timestamps null: false
    end
  end
end
