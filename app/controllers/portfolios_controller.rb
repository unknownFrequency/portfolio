class PortfoliosController < ApplicationController
  def index
    @portfolio_items = Portfolio.all
  end

  def new
    @portfolio_item = Portfolio.new
  end

  def create
    @portfolio_item = Portfolio.new portfolio_params

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to @portfolio_item, notice: "Portfolio created succesfully!" }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @portfolio_item = Portfolio.find params[:id]
  end

  def edit
    @portfolio_item = Portfolio.find params[:id]
  end

  def update
    respond_to do |format|
      @portfolio_item = Portfolio.find params[:id]

      if @portfolio_item.update(portfolio_params)
        format.html { redirect_to @portfolio_item, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @portfolio_item }
      else
        format.html { render :edit }
        format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def portfolio_params
    params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image) 
  end
end
