class GateAppointmentsController < ApplicationController
  before_action :set_gate_appointment, only: [:show, :edit, :update, :destroy]

  def show

  end

  def index
    #debugger
    @gate_appointments = GateAppointment.paginate(page: params[:page], per_page: 4)
  end

  def new
    #debugger
    @gate_appointment = GateAppointment.new
  end

  def edit
  end

  def update
    respond_to do |format|
      if @gate_appointment.update(gate_appointment_params)
        format.html { redirect_to gate_appointment_url(@gate_appointment), notice: "Appointment was successfully updated..." }
        # format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @gate_appointment = GateAppointment.new(gate_appointment_params)
    @gate_appointment.user = current_user

    #debugger
    respond_to do |format|
      if @gate_appointment.save
        flash[:notice] = "Appointment saved successfully!!"
        format.html { redirect_to gate_appointment_url(@gate_appointment) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @gate_appointment.destroy
    redirect_to my_gate_appointments_path
  end

  private

  def set_gate_appointment
    @gate_appointment = GateAppointment.find(params[:id])
  end

  def gate_appointment_params
    params.require(:gate_appointment)
    .permit(:nbr, :eqId, :iso, :releaseNbr, :orderNbr, :trkcId, :tranType, :day, :line_id, :truck_license)
  end

end
