class ChatsController < ApplicationController
    
    def index
        @current_client = current_client
        @chats = Chat.where(
            [ "client1_id = ? or client2_id = ?", current_client.id, current_client.id]
        )
        @chat = @chats.first
        if @chat.nil?
            flash[:error] = 'No tienes chats.'
            redirect_to root_path
        else
            redirect_to show_chat_path(@chat.id)
        end
    end

    def create
        sender = Client.find(params[:sender])
        receiver = Client.find(params[:receiver])
        @chat = Chat.new(
            client1_id: sender.id,
            client2_id: receiver.id,
        )
        if @chat.save
            flash[:success] = 'Chat creado con éxito.'
            redirect_to chat_path
        else
            flash[:error] = 'No se pudo crear el chat.'
            render json: @chat.errors, status: :unprocessable_entity
        end
    end

    def show
        @current_client = current_client
        @chats = Chat.where(
            [ "client1_id = ? or client2_id = ?", current_client.id, current_client.id]
        )
        @chat = Chat.find(params[:chat_id])
        @client1 = Client.find(@chat.client1_id)
        @client2 = Client.find(@chat.client2_id)
        @messages = Message.where(chat_id: @chat.id)
    end
end
