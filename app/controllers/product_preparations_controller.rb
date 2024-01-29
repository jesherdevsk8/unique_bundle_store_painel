class ProductPreparationsController < ApplicationController
  before_action :set_product_preparations, only: [:show, :edit, :update, :destroy]
  before_action :load_references, only: [:new]
  # GET /product_preparations
  def index
    @product_preparations = ProductPreparation.paginate(page: params[:page], per_page: 15)
  end

  # GET /product_preparations/1/edit
  def edit; end

  # GET /product_preparations/new
  def new
    @product_preparation = ProductPreparation.new
  end

  # POST /product_preparations
  def create
    @product_preparation = ProductPreparation.new(product_preparations_params)

    if @product_preparation.save
      redirect_to product_preparations_path, notice: 'Preparação de Produto criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /product_preparations/1
  def update
    if @product_preparation.update(product_preparations_params)
      redirect_to product_preparations_path, notice: 'Preparação de Produto atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /product_preparations/1
  def destroy
    @product_preparation.destroy
    redirect_to product_preparations_path, notice: 'Preparação de Produto excluído com sucesso.'
  end

  private

  def load_references
    @products_without_preparation = Product.left_joins(:product_preparation).where(product_preparations: { id: nil })
  end

  # Set product_preparation by ID
  def set_product_preparations
    @product_preparation = ProductPreparation.find(params[:id])
  end

  # It allows only useful parameters.
  def product_preparations_params
    params.require(:product_preparation).permit(:product_id, :quantity)
  end
end