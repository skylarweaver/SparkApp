class UserSerializer < ActiveModel::Serializer
  attributes :id, :user_email, :first_name, :last_name, :token, :user_token, :created_at
  
  # def last_sign_in_at
  #   object.last_sign_in_at.strftime("%d/%m/%y %I:%M %p")
  # end
  
  def token
    user_token
  end
  
  
  def user_email
    object.email
  end
  
  def user_token
    object.authentication_token
  end

  def created_at
    object.created_at.strftime("%d/%m/%y %I:%M %p")
  end
  
end