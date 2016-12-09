class CreateCoreAddresses < ActiveRecord::Migration
  def change
    create_table :core_addresses do |t|
      t.references 'user', index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
