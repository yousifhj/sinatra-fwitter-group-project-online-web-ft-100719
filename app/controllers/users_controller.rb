class UsersController < ApplicationController

    get '/signup' do
        if !logged_in?
            erb :"users/signup"
        else 
            redirect "/tweets"
        end 
      end 

    post '/signup' do
        user = User.create(params)
        session[:user_id] = user.id
    
        if params[:username].empty? || params[:email].empty? || params[:password].empty?
          redirect '/signup'
        end
    
        redirect '/tweets'
    end

    get '/login' do
        if !logged_in?
          erb :'users/login'
        else
          redirect '/tweets'
        end
    end

    post '/login' do 
        user = User.find_by(username: params[:username])
        session[:user_id] = @user.id 
        redirect '/tweets'
    end

 end 

