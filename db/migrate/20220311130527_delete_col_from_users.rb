class DeleteColFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :private_api_key_ciphertext
    remove_column :users, :private_api_key_bidx

  end
end
