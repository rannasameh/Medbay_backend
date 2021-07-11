class PatientsController < ApplicationController
    #skip_before_action :authenticate_user,only:create
    def show
       @patient=Patient.find(params[:id])
       @allergies=@patient.allergies.all
       @diseases=@patient.diseases.all
       @operations=@patient.operations.all
       @medications=@patient.medication_histories.all
       @special_habits=@patient.special_habits.all
       @patientdetails={id: @patient.id,email: @patient.email,zip_code: @patient.zip_code,state: @patient.state,patient_first_name:@patient.first_name,patient_last_name:@patient.last_name,date_of_birth: @patient.date_of_birth,gender: @patient.gender,street: @patient.street,building: @patient.building,city: @patient.city,country: @patient.country,medications: @medications,operations: @operations,diseases: @diseases,allegries: @allergies,marital_status: @patient.marital_status,phone_number: @patient.phone_number,emergency_first_name: @patient.emergency_first_name,emergency_last_name: @patient.emergency_last_name,emergency_phone_number: @patient.emergency_phone_number,
    family_allergies: @patient.family_allergies,family_diseaeses: @patient.family_diseaeses,family_other_illnesses: @patient.family_other_illnesses,weight: @patient.weight,height: @patient.height,blood_type: @patient.blood_type,special_habits: @special_habits}

        render json: {status:"200",message:@patientdetails}, status: :ok
    end

    def index 
        @patient=Patient.all
        render json: {status:"200",message:@patient}, status: :ok
    end
    def create 
        a=""
        d=""
        if params[:family_allergies]
            params[:family_allergies].each do |s|
                a << s[:family_allergy]
                a<< " "
                a << ","
                a<< " "
             end 
        end
        if params[:family_diseaeses]
            params[:family_diseaeses].each do |s|
                d << s
                d<< " "
                d << ","
                d<< " "
             end 
        end
        if params[:family_other_illnesses]
            params[:family_other_illnesses].each do |s|
                d << s[:family_disease]
                d<< " "
                d << ","
                d<< " "
             end 
        end
        @patient=Patient.create!(email: params[:email],username: params[:username],password: params[:password],password_confirmation: params[:password_confirmation],first_name: params[:first_name],last_name: params[:last_name],date_of_birth: params[:date_of_birth],gender: params[:gender],street: params[:street],building: params[:building],city: params[:city],state: params[:state],country: params[:country],zip_code: params[:zip_code],phone_number: params[:phone_number],marital_status: params[:marital_status],emergency_first_name: params[:emergency_first_name],emergency_last_name: params[:emergency_last_name],emergency_phone_number: params[:emergency_phone_number],weight: params[:weight],height: params[:height],blood_type: params[:blood_type],family_allergies: a,family_diseaeses: d)
        @p=[]
        @p << @patient
        diseases=params[:diseases]
        allergies=params[:allergies]
        operations=params[:operations]
        otherillnesses=params[:otherIllnesses]
        medications=params[:medications]
        special_habits=params[:special_habits]
        if diseases
        diseases.each do |d|
            @disease=@patient.diseases.create!(name: d) if  d.present?
            @p << @disease
        end 
    end
        if otherillnesses
        otherillnesses.each do |d|
            @otherillness=@patient.diseases.create!(name: d[:disease]) if  d[:disease].present?
            @p << @otherillness
        end 
    end
    if allergies
        allergies.each do |d|
            @allergy=@patient.allergies.create!(name: d[:allergy]) if  d[:allergy].present?
            @p << @allergy
        end
    end
    if operations
        operations.each do |d|
            @operation=@patient.operations.create!(operation_name: d[:operation_name],operation_date: d[:operation_date]) if  d[:operation_name].present?
            @p << @operation
        end
    end
    if medications
    medications.each do |d|
            @med=@patient.medication_histories.create!(name: d[:current_medication]) if  d[:current_medication].present?
            @p << @med
        end
    end
    if special_habits
        special_habits.each do |d|
            @special_habit=@patient.special_habits.create!(special_habit: d) if  d.present?
            @p << @special_habit
        end
    end

        render json: {status:"200",message:@p}, status: :ok
    end
    
    def update 
        @patient=Patient.find(params[:id])
        puts patient_params
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
    params.permit(:username,:email,:password,:password_confirmation,:first_name,:last_name,:date_of_birth,:gender,:street,:building,:city,:state,:zip_code,:country,:phone_number,:marital_status,:emergency_first_name,:emergency_last_name,:emergency_phone_number,:height,:weight,:blood_type,:family_allergies,:family_diseaeses,:family_other_illnesses)
    end
    def more_params
        params.permit(allergies,diseases,operations,operations_date,medications,special_habits,otherIllnesses) 
    end

end


