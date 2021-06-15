class ContactsController < ApplicationController
  def show_contact
    render json: { message: Contact.all }
  end
end
