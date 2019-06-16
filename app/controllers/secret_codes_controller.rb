class SecretCodesController < ApplicationController
    load_and_authorize_resource
    def index 
        @secrets = SecretCode.all
    end
    def new

    end

    def create
        #byebug
        code = params[:secret_code]["code"].to_i
        for i in 1..code do
            
            @secret_code = SecretCode.new
            #@secret_code.user_id = nil
            @secret_code.code = SecureRandom.uuid
            if @secret_code.save!
                @secret_code.errors.full_messages
            end
        end
        redirect_to secret_codes_path
    end

    private
        def secret_params
          params.require(:secret_code).permit(:code)
        end

end
