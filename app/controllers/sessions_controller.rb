class SessionsController < ApplicationController
    #skip_before_action :authenticate_user!
    def create
    if params[:account_type]=="Patient"
        @user=Patient.where(email: params[:email]).first
        if @user&.valid_password?(params[:password])
            jwt=JWT.encode({type: params[:account_type],id: @user.id},Rails.application.secrets.secret_key_base,'HS256')
            render json: {token:jwt,user:@user}, status: :ok
        else 
            render json: {status:"200",message:'Invalid email or password'}, status: :ok
        end
    else params[:account_type]=="Doctor"
        @user=Doctor.where(email: params[:email]).first
        if @user&.valid_password?(params[:password])
            jwt=JWT.encode({type: params[:account_type],id: @user.id},Rails.application.secrets.secret_key_base,'HS256')
            render json: {token:jwt,user:@user}, status: :ok
        else 
            render json: {status:"200",message:'Invalid email or password'}, status: :ok
        end 
    end
end

    private
    def  user_params
        params.permit(:email,:password,:account_type)
    end
end
