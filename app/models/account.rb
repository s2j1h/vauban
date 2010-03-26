class Account < ActiveRecord::Base
    validates_presence_of :name, :login, :password
end
