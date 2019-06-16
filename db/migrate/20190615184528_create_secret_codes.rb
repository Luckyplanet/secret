class CreateSecretCodes < ActiveRecord::Migration[5.1]
  def change
    create_table :secret_codes do |t|
      t.references :user, foreign_key: true
      t.string :code
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
