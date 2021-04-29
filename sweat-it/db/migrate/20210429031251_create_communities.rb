class CreateCommunities < ActiveRecord::Migration[6.1]
  def change
    create_table :communities do |t|
      t.references :user
      t.string :name
      t.text :bio
      t.string :url
      t.integer :total_members

      t.timestamps
    end
  end
end
