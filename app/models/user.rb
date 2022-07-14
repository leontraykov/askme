class User < ApplicationRecord
  has_secure_password

  before_save :downcase_nickname

  validates :nickname, :email, presence: true, uniqueness: true

  validates :nickname, length: { maximum: 500 }, format: { with: /\A[0-9a-zA-Z_]+\z/, 
    message: "hint: Letters, numbers and \"_\" are allowed in nickname" }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, 
    message: "error: it's not an email address" }

  def downcase_nickname
    nickname.downcase!
  end
end
