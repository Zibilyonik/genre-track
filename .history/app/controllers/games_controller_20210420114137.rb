class GamesController < ApplicationController
  before_action :set_game, only: %i[ show edit update destroy ]

  # GET /games or /games.json
  def index
    @games = current_user.games.all
    @total = 0
    @games.each{|x| @total += x.amount}
  end

  # GET /games/1 or /games/1.json
  def show
    @game = current_user.games.find(params[:id])
    @genres = @game.genres.all
  end

  # GET /games/new
  def new
    @game = current_user.games.new
  end

  # GET /games/1/edit
  def edit
  end

  def external
    @games = Game.all
    @genreless = []
    @games.each {|x| @genreless << x if x.genres.empty?}
    @genreless
  end
  
  # POST /games or /games.json
  def create
    @genre = current_user.genres.all
    @game = current_user.games.build(game_params)
    @genres = params[:genre]
    @genres.each{|x| @game.genres << current_user.genres.find(x)} unless @genres.nil?
    respond_to do |format|
      if @game.save
        format.html { redirect_to user_games_path(current_user), notice: "Game was successfully created." }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1 or /games/1.json
  def update
    @game = current_user.games.find_by(params[:id])
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to user_games_path, notice: "Game was successfully updated." }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1 or /games/1.json
  def destroy
    @game = current_user.games.find(params[:id])
    @game.destroy!
    redirect_to user_games_path(current_user)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = current_user.games.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:name, :amount)
    end
end