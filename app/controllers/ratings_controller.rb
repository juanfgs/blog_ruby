class RatingsController < ApplicationController
  def rate
    if @user = current_admin_user
      if
        @rate = Rate.new
        @rate.user = @user
        @rate.rating = params[:rate]
        @rate.post_id = params[:post_id]
        if @rate.save
          render json: { status: :ok, message: "Post rated" }      
        else
          render json: { errors: @rate.errors.full_messages }      
        end
      end
    end
  end
end
