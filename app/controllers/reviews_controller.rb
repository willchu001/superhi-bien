class ReviewsController < ApplicationController

  def index
    # this is our list page for our reviews

    @number = rand(100)

    #@reviews = ["The Smile", "Baby Bo's", "Chipotle", "Albion", "McDonald's"]

    @reviews = Review.all

  end

  def new

    # the form for adding a new review
    @review = Review.new

  end

  def create

    # take info from the form and add it to the db
    @review = Review.new(form_params)

    # save this to the db
    @review.save

    #redirect back to home page
    redirect_to root_path

  end

  def show

    #individual review page
    @review = Review.find(params[:id])

  end

  def destroy

    #find the inividual # REVIEW:
    @review = Review.find(params[:id])

    #destroy it
    @review.destroy

    #redirect back to home page
    redirect_to root_path

  end

  def edit

    @review = Review.find(params[:id])

  end


  def update

    @review = Review.find(params[:id])

    @review.update(form_params)

    redirect_to review_path(@review)

  end

  def form_params

      params.require(:review).permit(:title, :body, :score)

  end

end
