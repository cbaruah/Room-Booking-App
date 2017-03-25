class RoomReservesController < ApplicationController
  before_action :set_room_reserf, only: [:show, :edit, :update, :destroy]

  # GET /room_reserves
  # GET /room_reserves.json
  def index
    @room_reserves = RoomReserve.all
  end

  # GET /room_reserves/1
  # GET /room_reserves/1.json
  def show
  end

  # GET /room_reserves/new
  def new
    @room_reserf = RoomReserve.new
  end

  # GET /room_reserves/1/edit
  def edit
  end

  # POST /room_reserves
  # POST /room_reserves.json
  def create
    @room_reserf = RoomReserve.new(room_reserf_params)

    respond_to do |format|
      if @room_reserf.save
        RoomHistory.create(room_reserf_params)
        format.html { redirect_to @room_reserf, notice: 'Room reserve was successfully created.' }
        format.json { render :show, status: :created, location: @room_reserf }
      else
        format.html { render :new }
        format.json { render json: @room_reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_reserves/1
  # PATCH/PUT /room_reserves/1.json
  def update
    respond_to do |format|
      if @room_reserf.update(room_reserf_params)
        format.html { redirect_to @room_reserf, notice: 'Room reserve was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_reserf }
      else
        format.html { render :edit }
        format.json { render json: @room_reserf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_reserves/1
  # DELETE /room_reserves/1.json
  def destroy
    @room_reserf.destroy
    respond_to do |format|
      format.html { redirect_to room_reserves_url, notice: 'Room reserve was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_reserf
      @room_reserf = RoomReserve.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_reserf_params
      params.require(:room_reserf).permit(:room_no, :user_id, :start_time, :end_time)
    end
end
