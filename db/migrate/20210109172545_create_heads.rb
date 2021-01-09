class CreateHeads < ActiveRecord::Migration
  def change
    create_table :heads do |h|
      h.string :name
      h.float :price
      h.string :brand
      h.string :description
      h.string :img
      h.integer :user_id
    end
  end
end
