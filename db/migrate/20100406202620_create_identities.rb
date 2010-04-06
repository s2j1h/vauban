class CreateIdentities < ActiveRecord::Migration
  def self.up
    create_table :identities do |t|
      t.string :name
      t.string :url
      t.string :login
      t.string :password
      t.text :comment
      t.integer :user_id
      t.timestamps
    end
  end

  def self.down
    drop_table :identities
  end
end
