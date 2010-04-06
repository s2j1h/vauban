class User < ActiveRecord::Base
  acts_as_authentic
  #attr_accessible :username, :email, :password, :secretkey
  has_many :identities, :dependent => :destroy
end
