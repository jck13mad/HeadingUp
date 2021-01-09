class Head < ActiveRecord::Base

    validates_presence_of :name, :price, :brand, :img, :description

    belongs_to :user

end