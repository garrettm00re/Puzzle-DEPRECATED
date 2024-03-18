class CreateSignups < ActiveRecord::Migration[7.1]
  def change
    create_table :signups do |t|
      t.string :name
      t.string :email
      t.string :university

      t.timestamps
    end
  end
end
