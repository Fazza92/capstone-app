class Api::UsersController < ApplicationController
  def create
    @user = Create.new(
                        name: params[:name],
                        email: params[:email],
                        password: params[:password],
                        password_confirmation[:password_confirmation]
                      )
    @user.save
    render 'show.json.jbuilder'
  end
end
