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

    post '/heads' do
        if params.empty?
            redirect "/heads/new"
        elsif logged_in? && !params.empty?
            @head = current_user.heads.create(user_id: current_user.id, brand: params[:brand], name: params[:name], price: params[:price], img: params[:img], description: params[:description])
            if @head.save
                redirect "/heads/#{@head.id}"
            else
                redirect "/heads/new"
            end
        else
            redirect "/login"
        end
        
        current_user.save
    end

    get '/heads/:id' do
        if logged_in? 
            @head = Head.find_by_id(params[:id])
            erb :'/heads/view'
        else
            redirect "/login"
        end
    end 

    get '/heads/:id/edit' do
        @head = Head.find_by_id(params[:id])
        if params.empty?
            redirect "/heads/#{@head.id}/edit"
        elsif logged_in? && !params.empty? && current_user.heads.include?(@head)
            @head.update(user_id: current_user.id, brand: params[:brand], name: params[:name], price: params[:price], img: params[:img], description: params[:description])
            
            redirect "/heads/#{@head.id}"
        else
            redirect "/login"
        end
    end

end