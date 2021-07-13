class DoctorsController < ApplicationController
    def create 
        a=""
        b=""
        if params[:specialities]
            params[:specialities].each do |s|
               a << s
               a<< " "
               a << ","
               a<< " "
            end 
            if params[:clinic_working_days]
                params[:clinic_working_days].each do |d|
                b<< d
                b<<" "
                end
            end
        end
        
        @doctor=Doctor.create!(email: params[:email],specialities: a,username: params[:username],password: params[:password],password_confirmation: params[:password_confirmation],first_name: params[:first_name],last_name: params[:last_name],date_of_birth: params[:date_of_birth],gender: params[:gender],street: params[:street],building: params[:building],city: params[:city],state: params[:state],country: params[:country],zip_code: params[:zip_code],phone_number: params[:phone_number],marital_status: params[:marital_status],emergency_first_name: params[:emergency_first_name],emergency_last_name: params[:emergency_last_name],emergency_phone_number: params[:emergency_phone_number],years_of_experience: params[:years_of_experience],latest_acdemic_achievment: params[:latest_acdemic_achievment],clinic_street: params[:clinic_street],clinic_building: params[:clinic_building],clinic_city: params[:clinic_city],clinic_state: params[:clinic_state],clinic_zip_code: params[:clinic_zip_code],clinic_country: params[:clinic_country],clinic_working_hours_from: params[:clinic_working_hours_from],clinic_working_hours_to: params[:clinic_working_hours_to],clinic_phone_number: params[:clinic_phone_number],clinic_working_days: b)
        render json: {status:"200",message:@doctor}, status: :ok
    end

    def destroy
     @doctor=Doctor.find(params[:id])
     if @doctor.destroy
        render json: {message:'Deleted'}, status: :ok
     else 
        render json: {status:"404",message:'Not found'}, status: :unprocessable_entity
     end
    end

    def show
        @doctor=Doctor.find(params[:id])
        @avatar = ' '
        @avatar = url_for(@doctor.avatar) if @doctor.avatar.attached?
        render json: {status:"200",message:@doctor, avatar: @avatar }, status: :ok
    end

    def index 
        @doctor=Doctor.verified.notbanned
        render json: {status:"200",message:@doctor}, status: :ok
    end
   
    def update
        @doctor=Doctor.find(params[:id])
        if @doctor.update(doctor_params)
            render json: {status:"200",message:@doctor}, status: :ok
        else
            render json: {status:"200",message:'error'}, status: :ok
        end
    end
 
    def increamentReports
        @doctor=Doctor.find(params[:id])
        numberofreports=@doctor.reports_number
        totalnumberofreports=numberofreports+1
        if @doctor.update_attribute(:reports_number,totalnumberofreports )
            render json: {status:"200",message:@doctor}, status: :ok
        else
            render json: {status:"200",message:'error'}, status: :ok
        end

    end

    private
    def  doctor_params
    params.permit(:username,:email,:password_confirmation,:password,:first_name,:last_name,:date_of_birth,:gender,:street,:building,:city,:state,:zip_code,:country,:phone_number,:marital_status,:emergency_first_name,:emergency_last_name,:emergency_phone_number,:years_of_experience,:specialities,:latest_acdemic_achievment, :clinic_street,:clinic_building , :clinic_city , :clinic_state, :clinic_country ,:clinic_working_hours_from, :clinic_zip_code,:clinic_working_hours_to ,:clinic_phone_number ,:rating,:clinic_working_days, :avatar, :certificates)
    end
end


      
      
  
