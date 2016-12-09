class CreateCoreUsers < ActiveRecord::Migration
  def change
    create_table :core_users do |t|

      t.timestamps null: false
    end
  end
end
