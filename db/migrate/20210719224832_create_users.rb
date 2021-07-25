class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password
      t.integer :happiness
      t.integer :nausea
      t.integer :hieght
      t.integer :tickets

      t.timestamps
    end
  end
end
