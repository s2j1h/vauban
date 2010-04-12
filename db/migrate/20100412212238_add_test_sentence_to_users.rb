class AddTestSentenceToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :test_sentence, :string
  end

  def self.down
    remove_column :users, :test_sentence
  end
end
