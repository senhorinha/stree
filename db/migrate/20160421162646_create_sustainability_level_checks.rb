class CreateSustainabilityLevelChecks < ActiveRecord::Migration
  def change
    create_table :sustainability_level_checks do |t|
      t.string :level
      t.belongs_to :edifice, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
