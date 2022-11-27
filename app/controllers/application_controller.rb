class ApplicationController < ActionController::Base
    add_flash_types :danger, :info, :warning, :success, :messages
    before_action :authenticate_user!, except: %i[]

    
end
