class AddUniqueIndexToRelationships < ActiveRecord::Migration[6.1]
  def change
    add_index :relationships, %i[following_id follower_id], unique: true
  end
end
