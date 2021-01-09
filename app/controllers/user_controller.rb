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
            redirect "/signup"
        end
    end

    get '/login' do
        # user = User.find(:username => params[:username])

        if !logged_in? 
            erb :'/users/login'
        else
            redirect "/heads"
        end
    end

    post '/login' do
        user = User.find_by(:email => params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/heads"
        else
            redirect "/login"
        end
    end

    get '/logout' do
        if logged_in?
            session.destroy
            redirect "/login"
        else
            redirect "/"
        end
    end

end