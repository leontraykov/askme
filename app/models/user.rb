class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :nickname, :email, presence: true, uniqueness: true

  validates :nickname, length: { maximum: 500 }, format: { with: /\A\w+\z/ }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def downcase_nickname
    nickname.downcase!
  end
end
