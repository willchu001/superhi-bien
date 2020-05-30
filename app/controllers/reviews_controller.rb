class ReviewsController < ApplicationController

  before_action :check_login, except: [:index, :show]

  def index
    # this is our list page for our reviews

    # @number = rand(100)

    #@reviews = ["The Smile", "Baby Bo's", "Chipotle", "Albion", "McDonald's"]

    @price = params[:price]
    @cuisine = params[:cuisine]
    @location = params[:location]


    @reviews = Review.all

    if @price.present?
      @reviews = @reviews.where(price: @price)
    end

    if @cuisine.present?
      @reviews = @reviews.where(cuisine: @cuisine)
    end

    if @location.present?
      @reviews = @reviews.near(@location)
    end

    # if @price.present?
    #
    #   @reviews = Review.where(price: @price)
    #
    # else
    #
    #   @reviews = Review.all
    #
    #end

  end

  def new

    # the form for adding a new review
    @review = Review.new

  end

  def create

    # take info from the form and add it to the db
    @review = Review.new(form_params)

    @review.user = @current_user

    # we want to check if model can be saved
    if @review.save
      redirect_to root_path
    else
      render "new"
    end

  end

  def show

    #individual review page
    @review = Review.find(params[:id])

  end

  def destroy

    #find the inividual # REVIEW:
    @review = Review.find(params[:id])



    if @review.user == @current_user
      #destroy it
      @review.destroy

      #redirect back to home page
      redirect_to root_path
    else
      redirect_to review_path(@review)
    end

  end

  def edit

    @review = Review.find(params[:id])

    if @review.user != @current_user
      redirect_to review_path(@review)
    end

  end


  def update

    @review = Review.find(params[:id])

    if @review.user != @current_user
      redirect_to review_path(@review)
    else
      if @review.update(form_params)
        redirect_to review_path(@review)
      else
        render "edit"
      end
    end

    # @review.update(form_params)
    #
    # redirect_to review_path(@review)

  end

  def form_params

      params.require(:review).permit(:title, :restaurant, :body, :score, :ambience, :phone_number, :cuisine, :price, :address)

  end

end
