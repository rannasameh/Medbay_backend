class ApplicationController < ActionController::API
    #before_action :require_login


   # private
    #def require_login
    #raise JWT:: VerificationError unless request.headers['Authorization']
    #token= request.headers['Authorization'].split('')[1]
    #type=JWT.decode(token, Rails.application.secrets.secret_key_base)[0]['account_type']
    #current_user=JWT.decode(token, Rails.application.secrets.secret_key_base)[0]['id']
    #end

end
