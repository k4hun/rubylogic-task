class RequestsController < ApplicationController
  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    if @request.save
      redirect_to root_path, notice: 'Zgłoszenie pomyślnie wysłane!'
    else
      render 'new', error: 'Nie udało się wysłać zgłoszenia!'
    end
  end

  private
  def request_params
    params.require(:request).permit(:description, :category, :email)
  end
end
