class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.text :auth_hash

      t.timestamps null: false
    end
  end
end
