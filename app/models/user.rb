class User < ActiveRecord::Base
  has_secure_password #this method check password == password_conformation
  has_many :reviews

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true
  validates :password_confirmation, presence: true, length: { minimum: 3 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    user && user.authenticate(password) ? user : nil
  end
end
