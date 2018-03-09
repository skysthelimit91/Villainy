class PrisonersController < ApplicationController

  before_action :ensure_signed_in
  before_action :load_prisoner, only: [:show, :edit, :update, :destroy]

  def new
    @prisoner = Prisoner.new
  end

  def create
    @prisoner = Prisoner.new(create_params)
    @prisoner.user_id = current_user.id

    if @prisoner.save
      flash[:notice] = 'Prisoner has been locked away!'
      redirect_to prisoner_path(@prisoner)
    else
      flash[:error] = @prisoner.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
  end

  def update
    if @prisoner.update(update_params)
      flash[:notice] = 'Prisoner file updated!'
      redirect_to prisoner_path(@prisoner)
    else
      flash[:error] = @prisoner.errors.full_messages.join(', ')
      render :edit
    end
  end

  def index
    @prisoners = current_user.prisoners
  end

  def show
  end

  def destroy
    @prisoner.destroy!

    flash[:notice] = "#{@prisoner.name} has made bail!"
    redirect_to prisoners_path
  end

  private

  def create_params
    params.require(:prisoner).permit(:name, :description, :image_url, :prison_id)
  end

  def update_params
    params.require(:prisoner).permit(:description)
  end

  def load_prisoner
    @prisoner = current_user.prisoners.find(params[:id])
  end
end
