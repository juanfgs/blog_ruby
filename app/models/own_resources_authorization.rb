class OwnResourcesAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    case subject
    when is_a?(Post)
      # Only let the author update and delete posts
      if action == :update || action == :destroy
        subject.user == user
      else
        true
      end
    when normalized(User)
      if action == :update || action == :destroy
        subject == user
      else
        true
      end
    else
      true
    end
  end

end
