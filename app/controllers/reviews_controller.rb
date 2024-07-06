class ReviewsController < ApplicationController
    before_action :authenticate_client!

    def new
        @review = Review.new
        @visited_client = Client.find(params[:client_id])
        @review.client_id = @visited_client.id
        @review.sender_id = current_client.id
    end

    def create
        @review = Review.new(review_params)
        @visited_client = Client.find(params[:client_id])
        @review.client_id = @visited_client.id
        @review.sender_id = current_client.id # Asigna el ID del cliente visitado
        if @review.save
            flash[:success] = 'Reseña creada con éxito.'
            redirect_to client_show_path(@visited_client)  # Redirige al perfil del cliente visitado
        else
            puts "Errors: #{@review.errors.full_messages}"  # Esto mostrará los mensajes de error
            render 'new'
        end
    end

    private
    def review_params
        params.require(:review).permit(:title, :grade, :content)
    end

end