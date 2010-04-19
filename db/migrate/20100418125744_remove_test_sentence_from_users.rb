class RemoveTestSentenceFromUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :test_sentence
  end

  def self.down
  end
end
