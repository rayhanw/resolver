class RemoveActionText < ActiveRecord::Migration[7.0]
  def change
    drop_table :action_text_rich_texts
    drop_table :active_storage_attachments
    drop_table :active_storage_variant_records
    drop_table :active_storage_blobs
  end
end
