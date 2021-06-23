class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def show
    id = params[:id]
    contact = Contact.find_by(id: id)
    render json: contact
  end

  def create
    results = Geocoder.search("Paris")
    results.first.coordinates

    contact = Contact.new(
      first_name: params[:first_name],
      last_name: params[:last_name],
      email: params[:email],
      phone_number: params[:phone_number],
      address: params[:address],
      latitude: params[:latitude],
      longitude: params[:longitude],
    )
    contact.save
    render json: contact
  end

  def update
    the_id = params[:id]
    contact = Contact.find_by(id: the_id)
    contact.first_name = params[:first_name] || contact.first_name
    contact.last_name = params[:last_name] || contact.last_name
    contact.email = params[:email] || contact.email
    contact.phone_number = params[:phone_number] || contact.phone_number
    contact.save
    render json: contact
  end

  def destroy
    the_id = params[:id]
    contact = Contact.find_by(id: the_id)
    contact.destroy
    render json: { message: "contact has been deleted" }
  end
end
