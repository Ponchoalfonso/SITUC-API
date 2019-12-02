class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :bus, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
