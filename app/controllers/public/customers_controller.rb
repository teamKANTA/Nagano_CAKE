class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!

  def show
  end

  def edit
  end

  def quit
  end

  def update
    if current_customer.update(customer_params)
      redirect_to customer_path
    else
      render "edit"
    end
  end

  def withdraw
  end

  private

  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end

end
