class AddResolverToErrors < ActiveRecord::Migration[7.0]
  def change
    add_column :errors, :resolver, :text
  end
end
