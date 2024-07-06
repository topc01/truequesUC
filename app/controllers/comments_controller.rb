class CommentsController < ApplicationController
    def create
        @comentario = Comment.new(
            product_id: params[:comment][:product_id],
            client_id: params[:comment][:client_id],
            content: params[:comment][:content]
          )
        if @comentario.save
            @comentarios = Comment.all
            @product = Product.find(params[:product_id])
            redirect_to product_path(@product)

        else
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        flash[:success] = 'Comentario eliminado con éxito.'
        @product = Product.find(params[:product_id])
        redirect_to product_path(@product)
    end
    def sesion 
        render new_client_session_path 
    end

    private
    def comentario_params
        params.require(:comment).permit(:product_id, :client_id, :content)
    end
end
