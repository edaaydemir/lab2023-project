class CreateCards < ActiveRecord::Migration[7.0]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :content
      t.integer :status

      t.timestamps
    end
  end
end
