class Identity < ActiveRecord::Base
      validates_presence_of :name, :login, :password
      belongs_to :user
end
