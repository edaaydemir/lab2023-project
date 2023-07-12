class AddColumnDueOnToCards < ActiveRecord::Migration[7.0]
  def change
    add_column :cards, :due_on, :date
  end
end
