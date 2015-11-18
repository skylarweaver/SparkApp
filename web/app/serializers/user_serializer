class UserSerializer < ActiveModel::Serializer
  attributes :user_email, :token, :user_token, :last_sign_in_at, :created_at, :purchases, :favorites, :purchased,:favorited,:balance
  
  def last_sign_in_at
    object.last_sign_in_at.strftime("%d/%m/%y %I:%M %p")
  end
  
  def token
    user_token
  end
  
  def favorites
    object.favorites.size
  end
  
  def purchases
    object.purchases.size
  end
  
  def purchased
    # Count purchases
    Purchase.joins(:upload).where("uploads.user_id = ?", object.id).count
  end
  
  def favorited
    # Count favorites
    Favorite.joins(:upload).where("uploads.user_id = ?", object.id).count
  end
  
  def balance
    purchased - purchases
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
