class TransactionsController < ApplicationController
  def index
    @q = Transaction.ransack(params[:q])
    @transactions = @q.result(:distinct => true).page(params[:page]).per(10)

    render("transaction_templates/index.html.erb")
  end

  def show
    @transaction = Transaction.find(params.fetch("id_to_display"))

    render("transaction_templates/show.html.erb")
  end

  def new_form
    @transaction = Transaction.new

    render("transaction_templates/new_form.html.erb")
  end

  def create_row
    @transaction = Transaction.new

    @transaction.seller_id = params.fetch("seller_id")
    @transaction.buyer_id = params.fetch("buyer_id")
    @transaction.sold_status = params.fetch("sold_status")
    @transaction.completed_status = params.fetch("completed_status")
    @transaction.location = params.fetch("location")
    @transaction.time = params.fetch("time")
    @transaction.listing_id = params.fetch("listing_id")

    if @transaction.valid?
      @transaction.save

      redirect_back(:fallback_location => "/transactions", :notice => "Transaction created successfully.")
    else
      render("transaction_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @transaction = Transaction.find(params.fetch("prefill_with_id"))

    render("transaction_templates/edit_form.html.erb")
  end

  def update_row
    @transaction = Transaction.find(params.fetch("id_to_modify"))

    @transaction.seller_id = params.fetch("seller_id")
    @transaction.buyer_id = params.fetch("buyer_id")
    @transaction.sold_status = params.fetch("sold_status")
    @transaction.completed_status = params.fetch("completed_status")
    @transaction.location = params.fetch("location")
    @transaction.time = params.fetch("time")
    @transaction.listing_id = params.fetch("listing_id")

    if @transaction.valid?
      @transaction.save

      redirect_to("/transactions/#{@transaction.id}", :notice => "Transaction updated successfully.")
    else
      render("transaction_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @transaction = Transaction.find(params.fetch("id_to_remove"))

    @transaction.destroy

    redirect_to("/transactions", :notice => "Transaction deleted successfully.")
  end
end
