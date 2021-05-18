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
    current_date=Date.today.to_s
    Time.new.localtime
    puts current_data
    dates=Appointment.where(doctor_id: params[:doctor_id]).distinct.pluck(:appointment_date)
    if dates
    dates.each do |date|
    time=Appointment.where(doctor_id: params[:doctor_id],appointment_date: date).pluck(:appointment_time)
    @slots[date]=@time
    end 

    end
   end

    private
    def  appointment_params
    params.permit(:patient_id, :doctor_id, :appointment_date, :appointment_time  )
    end
end
