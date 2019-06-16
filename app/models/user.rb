class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attr_accessor :secret
  validates :secret, :presence => true

  validate :secret_key_check

  after_save :after_save

  def after_save
    secret_code = SecretCode.where(code: self.secret).first
    secret_code.user_id = self.id
    secret_code.save
  end

  def secret_key_check
    secret_code = SecretCode.where(code: self.secret,user_id: ["",nil])
    if secret_code.empty?
         errors.add(:secret, "Invalid secret code.")
    end
  end
end
