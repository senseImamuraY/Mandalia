class User < ApplicationRecord
            # Include default devise modules.
        
            devise :database_authenticatable, :registerable,
                :recoverable, :rememberable, 
                # :trackable, 
                :validatable,
                # :confirmable,
                :omniauthable
        # before_save -> { skip_confirmation! }
            include DeviseTokenAuth::Concerns::User
#   before_save { self.email = email.downcase }
#   validates :name, presence: true, length: { maximum: 50 }
#   VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
#   validates :email, presence: true, length: { maximum: 255 },
#                     format: { with: VALID_EMAIL_REGEX },
#                     uniqueness: { case_sensitive: false }
#   has_secure_password
  has_many :main_targets
end
