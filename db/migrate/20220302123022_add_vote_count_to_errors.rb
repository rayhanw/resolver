class AddVoteCountToErrors < ActiveRecord::Migration[7.0]
  def change
    add_column :errors, :votes, :integer, default: 0
  end
end
