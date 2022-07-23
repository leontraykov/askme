class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname

  validates :nickname, :email, presence: true, uniqueness: true

  validates :nickname, length: { maximum: 500 }, format: { with: /\A\w+\z/ }

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  validates :header_color, format: { with: /\A#[a-f0-9]{6}\z/i }

  def downcase_nickname
    nickname.downcase!
  end
end
