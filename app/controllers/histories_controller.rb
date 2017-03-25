class HistoriesController < ApplicationController
 # before_action :set_history, only: [:show, :edit, :update, :destroy]

  # GET /histories
  # GET /histories.json
  def index
    @histories = History.all
  end

  # GET /histories/1
  # GET /histories/1.json
  def show
  end

  # GET /histories/new
  def new
      @history = History.new
  end

  # GET /histories/1/edit
  def edit
  end

  # POST /histories
  # POST /histories.json
  def create
    puts params[:date]
    @room = Room.find(params[:id])
    respond_to do |format|
      if @room.histories.create(user: current_user, created_at: Time.now, date: params[:date], slot: params[:slot])
       # @room.histories.update_attribute(date:, para)
        @room.update(status: "Booked")
        ###Send email functionality
        UserNotifierMailer.send_signup_email(current_user.email).deliver
        #@emails = params["booking"]["members"].split(',')
        format.html { redirect_to @room, notice: 'Room Booked Successfully!!' }
      else
        format.html { render @room, notice: 'Unable to Room' }
      end
    end
  end

  def email_notification
    @room = Room.find(params[:id])
    puts params[:emails]
    ###Send email functionality
    respond_to do |format|
      @emails = params[:emails].split(',')
      @emails.each do |email|
        UserNotifierMailer.send_signup_email(email).deliver
        format.html { redirect_to @room, notice: 'Email Sent Successfully!!' }
      end
    end
  end

  # PATCH/PUT /histories/1
  # PATCH/PUT /histories/1.json
  def update
    @history = History.find(params[:id])
    respond_to do |format|

        @history.update(status: 0)
        format.html { redirect_to @history, notice: 'Released successfully!!' }

    end
  end
  # DELETE /histories/1
  # DELETE /histories/1.json
  def destroy
    @history.destroy
    respond_to do |format|
      format.html { redirect_to histories_url, notice: 'History was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def user_history
    @user = User.find(params[:id])
    #respond_to do |format|
    unless current_user.admin?
      unless @user == current_user
        redirect_to :back, :alert => "Access denied."
      end
    end
  end

  def room_history
    #respond_to do |format|
    if current_user.admin?
      @room = Room.find(params[:id])
    else
      #format.html{ redirect_to root_path, error: 'Unable to access.' }
    end
    #end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history
      @history = History.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def history_params
     # params.require(:history).permit(:user_id, :room_id).merge(date: params[:date], slot: params[:slot])
      params.require(:history).permit(:user_id, :room_id, :date, :slot)
    end
end
