class AddStatusToErrors < ActiveRecord::Migration[7.0]
  def change
    add_column :errors, :status, :integer, default: 0
  end
end
