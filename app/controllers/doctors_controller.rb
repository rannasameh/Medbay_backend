class DoctorsController < ApplicationController
    def create 
        @doctor=Doctor.create(doctor_params)
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
        render json: {status:"200",message:@doctor}, status: :ok
    end
    def index 
        @doctor=Doctor.all
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

 

    private
    def  doctor_params
    params.permit(:username,:email,:password_confirmation,:password,:first_name,:last_name,:date_of_birth,:gender,:street,:building,:city,:state,:zip_code,:country,:phone_number,:marital_status,:emergency_first_name,:emergency_last_name,:emergency_phone_number,:years_of_experience,:specialities,:latest_acdemic_achievment, :clinic_street,:clinic_building , :clinic_city , :clinic_state ,:from,:to ,:clinic_phone_number ,:rating  )
    end
end


      
      
  
