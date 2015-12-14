class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.date :date
      t.text :body
      t.references :goal, index: true, foreign_key: true

      t.timestamps
    end
  end
end
