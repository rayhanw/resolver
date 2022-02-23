class CreateErrors < ActiveRecord::Migration[7.0]
  def change
    create_table :errors do |t|
      t.string :title
      t.text :details

      t.timestamps
    end
  end
end
