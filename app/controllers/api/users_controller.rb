class Api::UsersController < ApplicationController
  def create
    @user = User.new(
                        name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation: params[:password_confirmation]
                      )

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    user_id = params[:id]
    @user = User.find(user_id)
    render 'show.json.jbuilder'
  end

end
