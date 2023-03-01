class AddPriceToTreatments < ActiveRecord::Migration[7.0]
  def change
    add_column :treatments, :price, :integer
  end
end
