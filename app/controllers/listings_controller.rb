class ListingsController < ApplicationController
  before_action :current_user_must_be_listing_creator, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_listing_creator
    listing = Listing.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == listing.creator
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @listings = Listing.all

    render("listing_templates/index.html.erb")
  end

  def show
    @listing = Listing.find(params.fetch("id_to_display"))

    render("listing_templates/show.html.erb")
  end

  def new_form
    @listing = Listing.new

    render("listing_templates/new_form.html.erb")
  end

  def create_row
    @listing = Listing.new

    @listing.transaction_id = params.fetch("transaction_id")
    @listing.isbn = params.fetch("isbn")
    @listing.course = params.fetch("course")
    @listing.photo_url = params.fetch("photo_url") if params.key?("photo_url")
    @listing.price = params.fetch("price")
    @listing.description = params.fetch("description")
    @listing.creator_id = params.fetch("creator_id")
    @listing.quarter = params.fetch("quarter")
    @listing.school_year = params.fetch("school_year")
    @listing.tittle = params.fetch("tittle")

    if @listing.valid?
      @listing.save

      redirect_back(:fallback_location => "/listings", :notice => "Listing created successfully.")
    else
      render("listing_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @listing = Listing.find(params.fetch("prefill_with_id"))

    render("listing_templates/edit_form.html.erb")
  end

  def update_row
    @listing = Listing.find(params.fetch("id_to_modify"))

    @listing.transaction_id = params.fetch("transaction_id")
    @listing.isbn = params.fetch("isbn")
    @listing.course = params.fetch("course")
    @listing.photo_url = params.fetch("photo_url") if params.key?("photo_url")
    @listing.price = params.fetch("price")
    @listing.description = params.fetch("description")
    
    @listing.quarter = params.fetch("quarter")
    @listing.school_year = params.fetch("school_year")
    @listing.tittle = params.fetch("tittle")

    if @listing.valid?
      @listing.save

      redirect_to("/listings/#{@listing.id}", :notice => "Listing updated successfully.")
    else
      render("listing_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_creator
    @listing = Listing.find(params.fetch("id_to_remove"))

    @listing.destroy

    redirect_to("/users/#{@listing.creator_id}", notice: "Listing deleted successfully.")
  end

  def destroy_row
    @listing = Listing.find(params.fetch("id_to_remove"))

    @listing.destroy

    redirect_to("/listings", :notice => "Listing deleted successfully.")
  end
end
