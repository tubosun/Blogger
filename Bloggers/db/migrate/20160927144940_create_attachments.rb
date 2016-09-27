class CreateAttachments < ActiveRecord::Migration[5.0]
  def change
    create_table :attachments do |t|
     	t.image :image
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
