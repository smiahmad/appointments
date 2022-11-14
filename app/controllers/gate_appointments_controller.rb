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

  private

  def set_gate_appointment
    @gate_appointment = GateAppointment.find(params[:id])
  end

  def gate_appointment_params
    params.require(:gate_appointment).permit(:nbr, :eqId, releaseNbr:, orderNbr:, trkcId:, type: [])
  end

end
