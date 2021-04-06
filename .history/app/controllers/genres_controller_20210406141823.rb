class GenresController < ApplicationController
  before_action :set_genre, only: %i[ show edit update destroy ]

  # GET /genres or /genres.json
  def index
    @genres = current_user.genres.all
  end

  # GET /genres/1 or /genres/1.json
  def show
    @genre = current_user.genres.find(params[:id])
  end

  # GET /genres/new
  def new
    @genre = current_user.genres.new
  end

  # GET /genres/1/edit
  def edit
  end

  # POST /genres or /genres.json
  def create
    @genre = current_user.genres.build(genre_params)

    respond_to do |format|
      if @genre.save
        format.html { redirect_to user_genres_path(current_user), notice: "Genre was successfully created." }
        format.json { render :show, status: :created, location: @genre }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /genres/1 or /genres/1.json
  def update
    respond_to do |format|
      if @genre.update(genre_params)
        format.html { redirect_to @genre, notice: "Genre was successfully updated." }
        format.json { render :show, status: :ok, location: @genre }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @genre.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /genres/1 or /genres/1.json
  def destroy
    @genre.destroy
    respond_to do |format|
      format.html { redirect_to genres_url, notice: "Genre was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = current_user.genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name, :description)
    end
end
