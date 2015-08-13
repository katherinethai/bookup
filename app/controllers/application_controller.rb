
require 'bundler'
Bundler.require

require './config/environment.rb'

class MyApp < Sinatra::Base
  
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
   get '/' do
    erb :index
  end
  
  protected
  def authenticate
    before_filter :contribute
    authenticate_or_request_with_http_basic do |username, password|
      username == "admin" && password == "test"
      
    end
  end
  
  post '/newbook' do
      @book = Book.new(:title => params[:title],
        :text => params[:text],
        :author => params[:author],
        :genre => params[:genre],
        :imagelink => params[:imagelink],
        :amazonlink => params[:amazonlink])

      if @book.save 
        @message = "Congratulations! Your book has been successfully submitted!"
      else
        @error = "Oh no! Your submission failed."
      end 
      erb :index
end
   post '/contribute' do
     erb :contribute
  end
    get '/home' do
    @random_text = Book.all.sample
    erb :home
  end
  
    get '/' do
      erb :index
    end
    
  post '/home' do
@random_text = Book.all.sample
    erb :home
    end
  
    get '/contribute' do
      erb :contribute
  end
  
  post "/reveal_book" do  
    redirect "/book/#{params[:text].to_i}"
  end
  
  
  get '/book/:id' do
    @book = Book.find(params[:id])
    erb :reveal_book
  end
  
#   get "/home" do
#      @random_text = display_random_text($books)
#     erb :home
#    end
  
end