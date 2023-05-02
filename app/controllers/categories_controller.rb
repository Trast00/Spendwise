class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, only: %i[show edit update destroy]
  before_action :authorize_user

  # GET /categories or /categories.json
  def index
    @categories = Categorie.includes(:payments)
      .where(user: current_user).order(updated_at: :desc)

    @total_amount = Categorie.total_amount(@categories)
  end

  # GET /categories/1 or /categories/1.json
  def show
    # redirect_to payements_url
    redirect_to category_payments_path(@category)
  end

  # GET /categories/new
  def new
    @category = Categorie.new
  end

  # GET /categories/1/edit
  def edit; end

  # POST /categories or /categories.json
  def create
    @category = Categorie.new(category_params)
    @category.user = current_user

    respond_to do |format|
      if @category.save
        format.html { redirect_to category_payments_path(@category), notice: 'Categorie was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_payments_path(@category), notice: 'Categorie was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Categorie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Categorie.find_by(id: params[:id])
    redirect_to '/not_found' if @categorie
  end

  def authorize_user
    @categorie = Categorie.find_by(id: params[:id])
    redirect_to '/not_accessible' if @categorie && (cannot? :manage, @categorie)
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:categorie).permit(:name, :icon)
  end
end
