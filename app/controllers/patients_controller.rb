class PatientsController < ApplicationController
    def show
        @patient=Patient.find(params[:id])
        render json: {status:"200",message:@patient}, status: :ok
    end

    def index 
        @patient=Patient.all
        render json: {status:"200",message:@patient}, status: :ok
    end
    def create 
        @patient=Patient.create!(patient_params)
        if params[:allergies]
        @allergy=@patient.allergies.create!(name: params[:allergies])
        end
        if params[:diseases]
        @disease=@patient.diseases.create!(name: params[:diseases])
        end
        if params[:operations]
        @operation=@patient.operations.create!(name: params[:operations])
        end
        if params[:medication]
        @medication_histories= @patient.medication_histories.create!(name: params[:medication])
        end
        render json: {status:"200",message:@patient}, status: :ok
    end
    
    def update
        @patient=Patient.find(params[:id])
        if @patient.update(patient_params)
            render json: {status:"200",message:@patient}, status: :ok
            
        else
            render json: {status:"200",message:'error'}, status: :ok
        end
    end

    def destroy
     @patient=Patient.find(params[:id])
     if @patient.destroy
        render json: {status:"200",message:'Deleted'}, status: :ok
     else 
        render json: {status:"404",message:'Not found'}, status: :unprocessable_entity
     end
    end



    private
    def  patient_params
    params.permit(:username,:email,:password,:password_confirmation,:first_name,:last_name,:date_of_birth,:gender,:street,:building,:city,:state,:zip_code,:country,:phone_number,:marital_status,:emergency_first_name,:emergency_last_name,:emergency_phone_number,:height,:weight,:blood_type,:family_allergies,:family_diseaeses)
    end
    

end


