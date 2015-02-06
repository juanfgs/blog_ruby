class OnlyUsersAuthorization < ActiveAdmin::AuthorizationAdapter

  def authorized?(action, subject = nil)
    case subject
    when normalized(Post)
      # Only let the author update and delete posts
      if action == :update || action == :destroy
        subject.user == user
      else
        true
      end
    else
      true
    end
  end

end

