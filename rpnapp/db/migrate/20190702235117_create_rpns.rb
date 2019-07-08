class CreateRpns < ActiveRecord::Migration[5.2]
  def change
    create_table :rpns do |t|
      t.string :input
      t.integer :answer
      t.timestamps
    end
  end
end
