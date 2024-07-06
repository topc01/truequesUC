class MessagesController < ApplicationController
    def create
        @chat = Chat.find(params[:chat_id])
        @message = Message.new(message_params)
        if @message.content == ""
            flash[:error] = 'Mensaje vacio'
            redirect_to show_chat_path(@chat.id)
            return
        end
        @message.chat_id = @chat.id
        @message.client_id = current_client.id
        if @message.save
            flash[:success] = 'Mensaje enviado con éxito.'
            redirect_to show_chat_path(@chat.id)
        else
            flash[:error] = 'No se pudo enviar el mensaje.'
            render json: @message.errors, status: :unprocessable_entity
        end
    end

    private
    def message_params
        params.require(:message).permit(:content)
    end
end
