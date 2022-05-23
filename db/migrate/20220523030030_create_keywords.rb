class CreateKeywords < ActiveRecord::Migration[7.0]
  def change
    create_table :keywords do |t|
      t.references :error, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.index [:error_id, :tag_id], unique: true

      t.timestamps
    end
  end
end
