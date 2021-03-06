class GamesController < ApplicationController
  before_action :set_game, only: %i[show edit update destroy]

  # GET /games or /games.json
  def index
    @games = current_user.games.order(created_at: :DESC).includes(:genres)
    @total = 0
    @games.each { |x| @total += x.amount }
  end

  # GET /games/1 or /games/1.json
  def show
    @game = Game.find(params[:id])
    @genres = @game.genres.all
  end

  # GET /games/new
  def new
    @game = current_user.games.new
  end

  # GET /games/1/edit
  def edit; end

  def external
    @genreless = Game.external.all
  end

  # POST /games or /games.json
  def create
    @genre = current_user.genres.all
    @game = current_user.games.build(game_params)
    @genres = params[:genre]
    @game.amount = 0 if @game.amount.nil?
    respond_to do |format|
      if @game.save
        @genres&.each { |x| @game.genres << Genre.find(x) }
        format.html { redirect_to user_games_path(current_user), notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: user_game_path(current_user, @game) }
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
        format.html { redirect_to user_games_path, notice: 'Game was successfully updated.' }
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
    @game = Game.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def game_params
    params.require(:game).permit(:name, :amount)
  end
end
