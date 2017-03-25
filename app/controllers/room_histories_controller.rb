class RoomHistoriesController < ApplicationController
  before_action :set_room_history, only: [:show, :edit, :update, :destroy]

  # GET /room_histories
  # GET /room_histories.json
  def index
   # if current_user.admin?
      @room_histories = RoomHistory.all
     # else
      #  @room_histories = RoomHistory.where(user_id: current_user)
   # end
  end

  # GET /room_histories/1
  # GET /room_histories/1.json
  def show
  end

  # GET /room_histories/new
  def new
    @room_history = RoomHistory.new
  end

  # GET /room_histories/1/editF
  def edit
  end

  # POST /room_histories
  # POST /room_histories.json
  def create
    @room_history = RoomHistory.new(room_history_params)

    respond_to do |format|
      if @room_history.save
        format.html { redirect_to @room_history, notice: 'Room history was successfully created.' }
        format.json { render :show, status: :created, location: @room_history }
      else
        format.html { render :new }
        format.json { render json: @room_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_histories/1
  # PATCH/PUT /room_histories/1.json
  def update
    respond_to do |format|
      if @room_history.update(room_history_params)
        format.html { redirect_to @room_history, notice: 'Room history was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_history }
      else
        format.html { render :edit }
        format.json { render json: @room_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_histories/1
  # DELETE /room_histories/1.json
  def destroy
    @room_history.destroy
    respond_to do |format|
      format.html { redirect_to room_histories_url, notice: 'Room history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_history
      @room_history = RoomHistory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_history_params
      params.require(:room_history).permit(:room_no, :user_id, :start_time, :end_time, :status)
    end
end
