class AdminController < ApplicationController
    def index
        @clients = Client.all
    end

    def destroy
        @client = Client.find(params[:id])
        chats = Chat.where(client1_id: @client.id).or(Chat.where(client2_id: @client.id))
        messages = Message.where(chat_id: chats.ids)
        messages.destroy_all
        chats.destroy_all
        reviews = Review.where(client_id: @client.id)
        reviews.destroy_all
        @client.destroy

        redirect_to admin_page_path, status: :see_other
    end

    def destroy_review
        @review = Review.find(params[:id])
        @review.destroy

        redirect_to admin_page_path, status: :see_other
    end

    def destroy_product
        @product = Product.find(params[:id])
        requests = Request.where(product_id: @product.id).or(Request.where(offer_id: @product.id))
        requests.destroy_all
        comments = Comment.where(product_id: @product.id)
        comments.destroy_all
        @product.destroy

        redirect_to admin_page_path, status: :see_other
    end
end
