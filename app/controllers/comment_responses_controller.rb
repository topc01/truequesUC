class CommentResponsesController < ApplicationController
    def create
        @response = CommentResponse.new(
          id_comment: params[:response][:id_comment],
          id_response: params[:response][:id_response],
          texto: params[:response][:texto]
        )
        
        if @response.save
          @product = Product.find(params[:product_id])
          redirect_to product_path(@product)
        else
        end
      end

    def destroy
        @response = CommentResponse.find(params[:id])
        @response.destroy
        flash[:success] = 'Comentario eliminado con éxito.'
        @product = Product.find(params[:product_id])
        redirect_to product_path(@product)
    end


    private
    def response_params
        params.require(:response).permit(:id_comment, :id_response, :texto)
    end
end
