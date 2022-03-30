class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :questions
  has_many :answers
  has_many :comments

  before_save { email.downcase! }
  before_save { username.downcase! }

  validates :name, presence: true,
                   length:   { maximum: 50 }

  validates :email, presence:   true,
                    email:      true,
                    length:     { maximum: 255 },
                    uniqueness: { case_sensitive: false }

  validates :password, presence: true,
                       allow_nil: true,
                       length: { minimum: 6 }

  validates :username, presence: true, uniqueness: { case_sensitive: false }

  # only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if (login = conditions.delete(:login))
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      where(conditions.to_h).first
    end
  end

end
