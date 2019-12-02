class TweetsController < ApplicationController

    #index
    get '/tweets' do 
        @tweets = Tweet.all
        erb :"tweets/index"
    end

end 
