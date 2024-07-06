class ClientsController < ApplicationController

    before_action :authenticate_client!, except: [:show]

    def show
        # Recupera el cliente actual, por ejemplo, a través de Devise
        @client = Client.find(params[:id])
        @is_current_client = current_client == @client
        @reviews = Review.where("client_id = ?", @client.id)
    end

    def destroy
    end

    def edit
        @client = current_client
    end

    def update
        @client = current_client # Asegúrate de que @client se refiera al cliente actualmente autenticado
        if @client.update(client_params) # client_params debe contener los campos que deseas actualizar
            redirect_to client_show_path(@client.id), notice: 'Perfil actualizado exitosamente.'
        else
            render :edit_profile # Si hay errores de validación, muestra nuevamente el formulario de edición
        end
    end

    def products
        @products = current_client.products
    end

    def reviews
        @reviews = current_client.reviews
    end 
    
    private
    def client_params
        params.require(:client).permit(
            :name, :email, :username, :description, :image, :phone_number, :image
        )
    end
end
