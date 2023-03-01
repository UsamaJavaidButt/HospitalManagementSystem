class RemovePriceFromTreatments < ActiveRecord::Migration[7.0]
  def change
    remove_column :treatments, :price, :integer
  end
end
