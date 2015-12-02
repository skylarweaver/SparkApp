class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  # GET /transactions
  # GET /transactions.json
  def requestedTransactions
    @lender_transactions = Transaction.where(lender_id: current_user.id, accepted: false)
    @borrow_transactions = Transaction.where(borrower_id: current_user.id, accepted: false)
    @requested_transactions = @lender_transactions + @borrow_transactions
    render json: @requested_transactions
  end

  def currentTransactions
    # obtain all transactions that are currently ongoing
    @lender_transactions = Transaction.where(lender_id: current_user.id, end_time: nil)
    @borrow_transactions = Transaction.where(borrower_id: current_user.id, end_time: nil)
    @current_transactions = @lender_transactions + @borrow_transactions
    render json: @current_transactions
  end

  def index
    @nil_transactions = Transaction.where.not(end_time: nil)

    @lender_user_transactions = Transaction.where(lender_id: current_user.id)
    @lender_transactions = @nil_transactions & @lender_user_transactions

    @borrow_user_transactions = Transaction.where(borrower_id: current_user.id)
    @borrow_transactions = @nil_transactions & @borrow_user_transactions

    @past_transactions = @lender_transactions + @borrow_transactions
    render json: @past_transactions
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)

    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:charger_id, :lender_id, :borrower_id)
    end
end
