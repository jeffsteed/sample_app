class User < ActiveRecord::Base
  before_save { email.downcase! }
  validates(:name, { presence: true, length: { maximum: 50 } })
  # [\w+\-.]+@(?:[a-z\d\-]+\.)+[a-z]+ - my solution to exercise
# /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i - original regex

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates(:email, {
    presence: true,
    length: { maximum: 255 },
    format: { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false }
    })

    has_secure_password
    validates(:password, { presence: true, length: { minimum: 6 } })
end
