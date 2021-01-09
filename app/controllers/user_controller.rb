class UserController < ApplicationController
    enable :sessions

    get '/signup' do
        if !logged_in?
            erb :'/users/signup'
        else
            redirect "/"
        end
    end 

    post '/signup' do
        user = User.create(:username => params[:username], :email => params[:email], :password => params[:password])
        
        if user.save 
            (session[:user_id] = user.id)
            redirect "/heads"
        else
            redirect '/signup'
        end
    end

    get '/login' do
        user = User.find(:username => params[:username])
        
        if !logged_in? 
            erb :'/users/login'
        else
            redirect '/heads'
        end
    end




end