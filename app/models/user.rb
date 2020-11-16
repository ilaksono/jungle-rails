class User < ActiveRecord::Base
  has_secure_password
  def self.authenticate_with_credentials email, password
    if User.find_by email: email
      return nil
    elsif password.length < 5
      return nil
    else
      return User.new(email: email, password: password)
  end  
end
