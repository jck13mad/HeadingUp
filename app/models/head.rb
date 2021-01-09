class User < ActiveRecord::Base

    has_secure_password
    validates :username, :uniqueness => {:case_sesnitive => false}
    validates_presence_of :username, :email, :password

    has_many :heads

end