class CreateSecretCodes < ActiveRecord::Migration
  def change
    create_table :secret_codes do |t|
      t.string :code, null: false, default: ""
      t.integer :user_id, default: 0, null: false
      t.integer :created_by, default: 0, null: false
      t.timestamps null: false
    end
  end
end
