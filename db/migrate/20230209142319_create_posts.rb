class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :body, null: false
      t.string :message_id, null: false
      t.references :author, null: false, polymorphic: true

      t.timestamps
    end
  end
end
