class AddCreditCardTypeToUser < ActiveRecord::Migration
  def change
	  add_column :users, :credit_card_type, :string
  end
end
