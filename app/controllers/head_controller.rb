class HeadController < ApplicationController

    get '/heads' do
        if logged_in? 
            @heads = Head.all
            erb :'/heads/index'
        else
            redirect "/login"
        end
    end

    get '/heads/new' do
        if logged_in?
            erb :'/heads/new'
        else
            redirect "/login"
        end
    end

    

end