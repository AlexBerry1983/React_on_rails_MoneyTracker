class TransactionsController < ApplicationController

  def index
    transactions = Transaction.all
    render :json => transactions
  end

  def show
    transaction = Transaction.find(params[:id])
    render :json => transaction
  end

  def create
    transaction = Transaction.create(transaction_params)
    render :json => transaction
  end

  def update
    transaction = Transaction.find(params[:id])
    if transaction.update_attributes(transaction_params)
      render :json => {status: :success}
    else
      render :json => {status: :update_failed}
    end
  end

  def destroy
    transaction = Transaction.find(params[:id])
    if transaction.destroy
      render :json => {status: :success}
    else
      render :json => {status: :delete_failed}
    end
  end

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :date)
  end

end
