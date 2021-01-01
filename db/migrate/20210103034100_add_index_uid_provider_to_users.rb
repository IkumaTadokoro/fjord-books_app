# frozen_string_literal: true

class AddIndexUidProviderToUsers < ActiveRecord::Migration[6.1]
  def change
    add_index :users, %i[provider uid], unique: true
  end
end
