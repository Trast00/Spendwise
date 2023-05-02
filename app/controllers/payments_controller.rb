class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :authorize_user

  # GET /payments or /payments.json
  def index
    @categorie = Categorie.find(params[:category_id])
    @payments = Payment.where(user: current_user, categorie: @categorie).order(updated_at: :desc)
  end

  # GET /payments/1 or /payments/1.json
  def show
    @categorie = Categorie.find(params[:category_id])
    @payment = Payment.find(params[:id])
  end

  # GET /payments/new
  def new
    @category = Categorie.find(params[:category_id])
    @payment = Payment.new
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    payment = Payment.new(payment_params)
    payment.user = current_user
    categorie = Categorie.find(params[:category_id])
    payment.categorie = categorie

    respond_to do |format|
      if payment.save
        format.html { redirect_to category_payments_path(categorie), notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to category_payment_path(@payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy

    respond_to do |format|
      format.html { redirect_to payments_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  def authorize_user
    redirect_to root_path, alert: 'Not authorized!' unless can? :manage, Categorie
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount)
  end
end
