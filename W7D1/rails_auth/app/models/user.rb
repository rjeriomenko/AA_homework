class User < ApplicationRecord
    attr_reader :password

    validates :username, :session_token, presence: true
    validates :password_digest, presence: { message: "Password can't be blank" }
    validates :password, length: { minimum: 6, allow_nil: true } ##can call validations on attributes, too. Doesnt do anything with pass besides checking if its long enough
    before_validation :######

    # def password=(password)
    # @password = password
    # self.password_digest = BCrypt::Password.create(password)
    # end
end
