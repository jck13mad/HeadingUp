class UserController < ApplicationController
    enable :sessions

    get '/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            redirect "/"
        end
    end 





end