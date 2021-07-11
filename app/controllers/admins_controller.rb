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
        totaldr=Doctor.verified.count
        pendingdrs=Doctor.notVerified.count
        femalePatients=Patient.where(gender: "Female").count
        malePatients=Patient.where(gender: "Male").count
        otherPatients=Patient.where(gender: "Other").count
        femaleDoctors=Doctor.verified.where(gender: "Female").count
        maleDoctors=Doctor.verified.where(gender: "Male").count
        otherDoctors=Doctor.verified.where(gender: "Other").count
        allpatients=Patient.all
        currentmonth=Time.now.month
        newPatients=allpatients.group_by{ |t| t.created_at.month==currentmonth}
        
       
        render json: {status: "200",totalPatients: totalPatients,totaldrs: totaldr,pending: pendingdrs,malePatients: malePatients,femalePatients: femalePatients,otherPatients: otherPatients,maleDoctors: maleDoctors,femaleDoctors: femaleDoctors,otherDoctors: otherDoctors,newPatients: newPatients}
    end
    def verifyDoctor
            @doctor=Doctor.find(params[:doctor_id])
            if @doctor.update_attribute(:verified, "verified")
                render json: {status:"200",message:@doctor}, status: :ok
            else
                render json: {status:"200",message:'error'}, status: :ok
            end
        
    end
    def banDoctor
        @doctor=Doctor.find(params[:doctor_id])
        if @doctor.update_attribute(:banned, "banned")
            render json: {status:"200",message:@doctor}, status: :ok
        else
            render json: {status:"200",message:'error'}, status: :ok
        end
    
    end
    def getBannedDoctors 
        @doctor=Doctor.banned
        render json: {status:"200",message:@doctor}, status: :ok
    end
    def getNotVerifiedDoctors 
        @doctor=Doctor.notVerified.notbanned
        render json: {status:"200",message:@doctor}, status: :ok
    end
    def getReportedDoctors 
        @doctor=Doctor.verified.where("reports_number > 5")
        render json: {status:"200",message:@doctor}, status: :ok
    end

   
private 
    def  admin_params
    
        params.permit(:email,:password_confirmation,:password,:first_name,:last_name,:city,:country,:phone_number)
 end

end
