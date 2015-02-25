class CreateHookahs < ActiveRecord::Migration
  def change
    create_table :hookahs do |t|
      t.string :title
      t.text :description

      t.timestamps null: false
    end
  end
end
