Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "listings#index"
  # Routes for the Transaction resource:

  # CREATE
  get("/transactions/new", { :controller => "transactions", :action => "new_form" })
  post("/create_transaction", { :controller => "transactions", :action => "create_row" })

  # READ
  get("/transactions", { :controller => "transactions", :action => "index" })
  get("/transactions/:id_to_display", { :controller => "transactions", :action => "show" })

  # UPDATE
  get("/transactions/:prefill_with_id/edit", { :controller => "transactions", :action => "edit_form" })
  post("/update_transaction/:id_to_modify", { :controller => "transactions", :action => "update_row" })

  # DELETE
  get("/delete_transaction/:id_to_remove", { :controller => "transactions", :action => "destroy_row" })

  #------------------------------

  # Routes for the Listing resource:

  # CREATE
  get("/listings/new", { :controller => "listings", :action => "new_form" })
  post("/create_listing", { :controller => "listings", :action => "create_row" })

  # READ
  get("/listings", { :controller => "listings", :action => "index" })
  get("/listings/:id_to_display", { :controller => "listings", :action => "show" })

  # UPDATE
  get("/listings/:prefill_with_id/edit", { :controller => "listings", :action => "edit_form" })
  post("/update_listing/:id_to_modify", { :controller => "listings", :action => "update_row" })

  # DELETE
  get("/delete_listing/:id_to_remove", { :controller => "listings", :action => "destroy_row" })
  get("/delete_listing_from_creator/:id_to_remove", { :controller => "listings", :action => "destroy_row_from_creator" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
