class PrisonsController < ApplicationController

  before_action :ensure_signed_in
  before_action :load_prison, only: [:show, :edit, :update, :destroy]

  def new
    @prison = Prison.new
  end

  def prisoners_by_prison 
    @prison = Prison.find(params[:id])
    

  end

  def create
      @prison = Prison.new(create_params)
      @prison.user = current_user


      if @prison.save
      flash[:notice] = 'Prison created!'
      redirect_to prison_path(@prison)
    else
      flash[:error] = @prison.errors.full_messages.join(', ')
      render :new
    end

  end

  def edit
  end


  def update
    if @prison.update(update_params)
      flash[:notice] = 'Prison updated!'
      redirect_to prison_path(@prison)
    else
      flash[:error] = @prison.errors.full_messages.join(', ')
      render :edit
    end
  end

  def index
    @prisons = current_user.prisons
  end

  def show
  end

  def destroy
    @prison.destroy!

    flash[:notice] = "#{@prison.number} has been shut down due to insufficient funding!"
    redirect_to prisons_path
  end

  private

  def create_params
    params.require(:prison).permit(:number)
  end

  def update_params
    params.require(:prison).permit(:number)
  end

  def load_prison
    @prison = current_user.prisons.find(params[:id])
  end
end