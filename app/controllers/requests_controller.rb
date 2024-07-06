class RequestsController < ApplicationController
    before_action :authenticate_client!
    
    def index
        client_id = current_client.id
        @requests_recieved = Request.where(
            [ "product_id IN (?)", Product.where("client_id = ?", client_id).ids]
        )
        @requests_sent = Request.where(
            [ "offer_id IN (?)", Product.where("client_id = ?", client_id).ids]
        )
    end

    def show
        @request = Request.find(params[:id])
        # @product = @request.product
        @product = Product.find(@request.product_id)
        @owner = @product.client

        @offer = Product.find(@request.offer_id)
        @client = @offer.client
        
        @is_owner = @owner.id == current_client.id
    end

    def new
        #@request = Request.new
        @product = Product.find(params[:product_id])
        @products_available = Product.where(
            [ "client_id = ? and id != ?", current_client.id, @product.id]
        )
    end

    def create
        @request = Request.new(
            product_id: params[:product_id],
            offer_id: params[:offer_id],
            state: "Pending",
        )
        if @request.save
            flash[:success] = 'Solicitud enviada con éxito.'
            redirect_to root_path
        else
            flash[:error] = 'No se pudo enviar la solicitud.'
            redirect_to root_path
        end
    end

    def destroy
        @request = Request.find(params[:id])
        @request.destroy
        flash[:success] = 'Solicitud eliminada con éxito.'
        redirect_to root_path
    end

    def accept
        @request = Request.find(params[:id])
        @request.state = "Accepted"
        product = Product.find(@request.product_id)
        product.available = false
        offer = Product.find(@request.offer_id)
        offer.available = false
        @request.save
        product.save
        offer.save
        flash[:success] = 'Solicitud aceptada con éxito.'
        redirect_to request_path
    end

    # private
    # def request_params
    #     params.require(:request).permit(:product_id, :offer_id, :state)
    # end
end
