class LoginController < ApplicationController
    def index
        # Check if the user is loggedin.
        if(session[:loggedin])
            redirect_to('/login');
        else
            redirect_to("/dash");
        end
    end
end
