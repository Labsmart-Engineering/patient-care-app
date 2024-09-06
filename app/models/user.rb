class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[google_oauth2]

  #This function checks if the user provided google email exists or not
  def self.from_omniauth(auth)
    user = where(google_auth_uid: auth.uid, email: auth.info.email).first do |u|
    end
    if user.present?
      user
    else
      nil
    end
  end

  #This function updates the user avatar_url and google_auth_id
  def update_user_credentials(auth)
    self.avatar_url = auth.info.image
    self.google_auth_uid = auth.uid
    self.save
  end
end
