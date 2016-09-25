module Authenticable

  # Devise methods overwrites
  
  def admins!
    render json: { errors: "Not authenticated" },
                status: :unauthorized unless current_user.role == "admins"
  end

end