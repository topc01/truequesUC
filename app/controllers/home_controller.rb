class HomeController < ApplicationController
    def home
        render 'pages/home'
    end
    def index
        @all_products = Product.all
    end
    def profile
        render 'home/profile'
    end
    def edit
        render 'home/edit_profile'
    end
    
    def chat
        @clients = Client.all
        render 'chat/chat'
    end

    def login
    end
end
