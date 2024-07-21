class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def search
    if params[:query].present?
      @movies = Movie.by_title(params[:query])
    else
      @movies = []
    end

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.update("search_results", partial: "movies/search_results", locals: {movies: @movies})
      end
    end
  end
end
