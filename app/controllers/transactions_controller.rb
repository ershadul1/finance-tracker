class TransactionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @transactions = current_user.transactions.includes(transaction_grouper: { picture_attachment: :blob })
  end

  def show
    @transaction = Transaction.find(params[:id])
  end

  def new
    @transaction = Transaction.new
  end

  def edit
    @transaction = Transaction.find(params[:id])
  end

  def create
    @transaction = current_user.transactions.build(transaction_params)
    @transaction.save
    @assigned_groups = params[:transaction][:group_ids]

    @assigned_groups&.each do |group|
      @transaction.transaction_grouper << Group.find(group)
    end

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

  def update
    @transaction = Transaction.find(params[:id])

    @assigned_groups = params[:transaction][:group_ids]

    @assigned_groups&.each do |group|
      @transaction.transaction_grouper << Group.find(group)
    end
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

  def destroy
    @transaction = Transaction.find(params[:id])
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def external
    all_transactions = current_user.transactions.pluck(:id)
    grouped = GroupsTransaction.where(grouped_transaction_id: all_transactions).pluck(:grouped_transaction_id)
    ungrouped = all_transactions - grouped
    @transaction = current_user.transactions.where(id: ungrouped)
  end

  private

  def transaction_params
    params.require(:transaction).permit(:name, :amount, :group_ids)
  end
end
