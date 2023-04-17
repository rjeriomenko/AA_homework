class User < ApplicationRecord
    attr_reader :password

    validates :username, presence: true
    validates :password_digest, presence: { message: "Password can't be blank" }
    validates :password, length: { minimum: 6, allow_nil: true } ##can call validations on attributes, too. Doesnt do anything with pass besides checking if its long enough
    validates :session_token, uniqueness: true, presence: true
    before_validation :ensure_session_token

    def password=(password) #will automatically be called/set when a new User with a password is created ("User.new")
        @password = password
        self.password_digest = BCrypt::Password.create(password) ### Password.creates generates password hash from password string
    end

    def is_password?(password) #checks to see if the password argument matches a user's password_digest (used in find_by_credentials)
        BCrypt::Password.new(password_digest).is_password?(password) ###Password.new creates Password object from password_digest (hashed_password)
    end

    # u = User.new
    # u.password = 'i_remember_kiki'
    # u.is_password?('i_remember_kiki') => true
    # u.is_password?('password_guess') => false

    def self.find_by_credentials(username, password) #finds a user if the username/password matches one. Else returns nil. Very important method
        user = User.find_by(username: username)
        return nil if user.nil?
        user.is_password?(password) ? user : nil
    end

    def reset_session_token!
        self.session_token = generate_unique_session_token
        self.save!
        self.session_token
    end

    private

    def generate_unique_session_token #generates a session token in a loop until session_token is unique
        #Uses SecureRandom::urlsafe_base64 to return a unique 16-digit pseudorandom string
        #"SecureRandom::urlsafe_base64" does not guarantee uniqueness. Wrapping
        #this call in a loop ensures that no other user has the generated token.
        loop do
            session_token = SecureRandom::urlsafe_base64(16)
            return session_token unless User.exists?(session_token: session_token)
        end
    end

    def ensure_session_token #makes sure that the user has a session_token set, setting one if none exists
        self.session_token ||= generate_unique_session_token
    end

end
