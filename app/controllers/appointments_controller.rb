class AppointmentsController < ApplicationController
    def create
        @isAvailable=Appointment.where(appointment_date: params[:appointment_date],appointment_time: params[:appointment_time],doctor_id: params[:doctor_id]).first
        if @isAvailable
        render json: {status:"200",message:'already taken'}, status: :ok
        else 
        @appointment=Appointment.create(appointment_params)
        render json: {status:"200",message:@appointment}, status: :ok
        end
    end
   def getTimeSlots
    @slots={}
    dates=Appointment.where(doctor_id: params[:doctor_id]).distinct.pluck(:appointment_date)
    if dates
    dates.each do |date|
    time=Appointment.where(doctor_id: params[:doctor_id],appointment_date: date).pluck(:appointment_time)
    @slots[date]=time
    end 
    end
    render json: {status:"200",message:@slots}, status: :ok
   end
   
   def getapp  
    @appointments=[]
    @appointment=Appointment.where(patient_id: params[:patient_id]).order(:appointment_date)
    @appointment.each do |med|
    dr=Doctor.find(med.doctor_id)
    @appointments << {patient_id: med.patient_id,doctor_id: med.doctor_id,appointment_date: med.appointment_date,appointment_time: med.appointment_time,doctor_fname: dr.first_name,doctor_lname: dr.last_name,ratings: dr.rating}
    end
    render json: {status:"200",message: @appointments}, status: :ok
end
def index  
    @appointments=[]
    @appointment=Appointment.all
    @appointment.each do |med|
    dr=Doctor.find(med.doctor_id)
    @appointments << {patient_id: med.patient_id,doctor_id: med.doctor_id,appointment_date: med.appointment_date,appointment_time: med.appointment_time,doctor_fname: dr.first_name,doctor_lname: dr.last_name}
    end
    render json: {status:"200",message: @appointments}, status: :ok

end 

def getPatients
patient_id=Appointment.where(doctor_id: params[:doctor_id]).distinct.pluck(:patient_id)
@patients=Patient.find(patient_id)
render json: {status:"200",message: @patients}, status: :ok
end

    private
    def  appointment_params
    params.permit(:patient_id, :doctor_id, :appointment_date, :appointment_time  )
    end
end
