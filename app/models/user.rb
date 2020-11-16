class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates_uniqueness_of :name, :case_sensitive => false
  validates_length_of :password, :minimum => 8 
  def self.authenticate_with_credentials email, password
    @user = User.find_by_email(email)    
    if @user.authenticate(password)
      return @user 
    else 
      return nil 
    end  
  end
end
