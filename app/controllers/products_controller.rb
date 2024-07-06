class ProductsController < ApplicationController
    before_action :authenticate_client!, except: [:index, :show]
    
    def index
        if not (params['category'].blank? or params['category']['id'].blank?)
            category = Category.find(params['category']['id'])
            products = category.products
        else
            products = Product.all
        end
        if client_signed_in?
            products = products.where("client_id != ? and available = true", current_client.id)
        end
        @products = products.search(params[:keywords])
    end
    
    def show
        @product = Product.find(params[:id])
        @categories = @product.categories
        @client = @product.client
        @comments = Comment.where(product_id: @product.id)
        @responses = CommentResponse.all
        if client_signed_in?
            @comment_client = current_client
        else
            @comment_client = Client.new
            @comment_client.id = 0
        end
    end

    def new
        @product = Product.new
        @categories = Category.all
    end

    def create
        @product = Product.new(product_params)
        @product.client_id = current_client.id  # Asocia el producto al cliente actual
    
        if @product.save
            flash[:success] = 'Producto creado con éxito.'
            redirect_to products_path  # Redirige a la lista de productos del cliente
        else
            render 'new'  # Vuelve a mostrar el formulario en caso de errores de validación
        end
    end

    def destroy
        @product = Product.find(params[:id])
    
        # Verifica si el producto pertenece al cliente actual antes de eliminarlo
        if @product.client == current_client
            requests = Request.where(product_id: @product.id).or(Request.where(offer_id: @product.id))
            requests.destroy_all
            comments = Comment.where(product_id: @product.id)
            comments.destroy_all
            @product.destroy
            flash[:success] = 'Producto eliminado con éxito.'
        else
            flash[:error] = 'No tienes permiso para eliminar este producto.'
        end
        redirect_to products_path  # Redirige de vuelta a la lista de productos
    end

    def categories
        @product_categories = Product.find(params[:id]).category_ids
        @categories = Category.findall(where: "id IN (?)", params: [@product_categories])
    end

    def summary
        @product = Product.find(params[:id])
    end

    def edit
        @product = Product.find(params[:id])
        @categories = Category.all
    end
    
    def update
        @product = Product.find(params[:id])
    
        # Verifica si el producto pertenece al cliente actual antes de editarlo
        if @product.client == current_client
            if @product.update(product_params)
                flash[:success] = 'Producto actualizado con éxito.'
                redirect_to product_path(@product)  # Redirige a la vista del producto actualizado
            else
                render 'edit'  # Vuelve a mostrar el formulario de edición en caso de errores de validación
            end
        else
            flash[:error] = 'No tienes permiso para editar este producto.'
            redirect_to products_path  # Redirige a la lista de productos
        end
    end
    

    private
    def product_params
        params.require(:product).permit(
            :title, :description, :weight, :clasification, :use, :state, :image, category_ids: []
        )
    end

end
