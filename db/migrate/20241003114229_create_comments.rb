class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.text :body, null: false
      t.references :user, null: false
      t.references :post, null: false

      t.timestamps
    end
  end
end
