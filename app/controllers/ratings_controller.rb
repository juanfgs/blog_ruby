class RatingsController < ApplicationController
  def rate
    @rate = Rating.new
    if @user = current_admin_user
    
      @rate.user = @user
      @rate.rating = params[:rating]
      @rate.post_id = params[:post_id]
      respond_to do |format|
        if @rate.save
          format.json { render json: { rate: @rate  } }
        else
          format.json { render json: { errors: @rate.errors }}
        end
      end
    else
      respond_to do |format|
          format.json { render json: { errors: { user: 'User not logged in' } }}
      end
    end
  end
end

