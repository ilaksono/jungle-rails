class User < ActiveRecord::Base
  has_secure_password
  validates :password_digest, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates_uniqueness_of :email, :case_sensitive => false
  validates_length_of :password, :minimum => 8 
  before_validation :strip_whitespace, :only => [:name, :email]
  def self.authenticate_with_credentials email, password
    @user = User.find_by_email(email)    
    if @user.authenticate(password)
      return @user 
    else 
      return nil 
    end  
  end
  def strip_whitespace
    self.name = self.name.strip unless self.name.nil?
    self.email = self.email.strip unless self.email.nil?
    self.email.downcase!
  end
end
