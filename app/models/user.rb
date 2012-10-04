class User < ActiveRecord::Base
  attr_accessible :email, :login, :password_digest
end
