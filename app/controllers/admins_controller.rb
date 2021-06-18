class AdminsController < ApplicationController
   
    def adminSignin 
            @user=Admin.where(email: params[:email]).first
            if @user&.valid_password?(params[:password])
                jwt=JWT.encode({id: @user.id},Rails.application.secrets.secret_key_base,'HS256')
                render json: {token:jwt,user:@user}, status: :ok
            else 
                render json: {status:"200",message:'Invalid email or password'}, status: :ok
            end
    end 
    def index 
        @admin=Admin.all
        render json: {status:"200",message:@admin, status: :ok}
    end
def getUsers
totalPatients=Patient.count
totaldr=Doctor.count
render json: {status:"200",message:totalPatients,drs:totaldr}
end
private 
    def  admin_params
    
        params.permit(:email,:password_confirmation,:password,:first_name,:last_name,:city,:country,:phone_number)
 end

end
