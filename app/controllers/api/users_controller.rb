class Api::UsersController < ApplicationController
  def create
    @user = Create.new(
                        name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation[:password_confirmation]
                      )

    if @user.save
      render 'show.json.jbuilder'
    else
      render json: {errors: @user.errors.full_messages}, status: :unprocessable_entity
    end
  end
end
