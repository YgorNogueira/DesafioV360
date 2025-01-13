class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :profile, dependent: :destroy
  after_create :create_profile

  has_many :todos, dependent: :destroy

  private

  def create_profile
    Profile.create(user: self, name: "New User")
  end
end
