require 'digest'

class User < ActiveRecord::Base
  acts_as_authentic
  #attr_accessible :username, :email, :password, :secretkey
  has_many :identities, :dependent => :destroy
  validates_confirmation_of :secretkey
  validates_length_of :secretkey,:minimum => 6
  validates_presence_of:secretkey

  before_create :hash_secretkey #one and only one time

  private
    def hash_secretkey
      self.secretkey = Digest::SHA256.hexdigest(self.secretkey)
    end



end
