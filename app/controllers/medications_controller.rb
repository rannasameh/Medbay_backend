class MedicationsController < ApplicationController
    def create 
        @createdmedication=[]
        medications=params[:medications]
        reports=params[:reports]
       if medications
        medications.each do |m|
            @medication=Medication.create!(name: m[:name],start_date: m[:start_date],dosage: m[:dose],duration: m[:duration],times: m[:times],patient_id: params[:patient_id],doctor_id: params[:doctor_id] ) if  m[:name].present?
            @createdmedication << @medication
        end 
    end
    if reports
        reports.each do |r|
            @report=Test.create!(name: r[:reportsName],patient_id: params[:patient_id],doctor_id: params[:doctor_id]) if  r[:reportsName].present?
            @createdmedication << @report
        end
    end
        render json: {status:"200",message:@createdmedication}, status: :ok
    end

    def getmedications
        @allmed=[]
        i=0
        @medication=Medication.where(patient_id: params[:patient_id]).order(:start_date)
        @medication.each do |med|
            repeat=med.duration
                dr=Doctor.find(med.doctor_id)
                repeat.times do 
                date=med.start_date + i.day
                i=i+1
                @allmed << {id: med.id,name: med.name,patient_id: med.patient_id,doctor_id: med.doctor_id,times: med.times,start_date: date,duration: med.duration,dosage: med.dosage,done: med.done,doctor_fname: dr.first_name,doctor_lname: dr.last_name}
            end
            i=0
         end

    render json: {status:"200",message:@allmed}, status: :ok
    end
    
    def index 
        @medication=Medication.all
    render json: {status:"200",message:@medication}, status: :ok
      
    end
    def destroy
        @medication=Medication.find(params[:id])
        if @medication.destroy
           render json: {status:"200",message:'Deleted'}, status: :ok
        else 
           render json: {status:"404",message:'Not found'}, status: :unprocessable_entity
        end
       end

   def updateMedication
    @updatedmedication=[]
    diseases=params[:disease]
    allergies=params[:allergy]
    operations=params[:operation]

    diseases.each do |d|
        @disease=Disease.create!(name: d[:disease],patient_id: params[:patient_id]) if  d[:disease].present?
        @updatedmedication << @disease
    end 
    allergies.each do |d|
        @allergy=Allergy.create!(name: d[:allergy],patient_id: params[:patient_id]) if  d[:allergy].present?
        @updatedmedication << @allergy
    end
    operations.each do |d|
        @operation=Operation.create!(operation_name: d[:operation_name],patient_id: params[:patient_id],operation_date: d[:operation_date]) if  d[:operation_name].present?
        @updatedmedication << @operation
    end
    render json: {status:"200",message:@updatedmedication}, status: :ok
   end

    private
    def  medications_params
    params.permit(:patient_id,:medications,:reports,doctor_id)
    end
    def disease_params
        params.permit(:disease,:patient_id)
    end
    def allergy_params
        params.permit(:allergy,:patient_id)
    end
    def operation_params
        params.permit(:operation,:patient_id)
    end
    
end
