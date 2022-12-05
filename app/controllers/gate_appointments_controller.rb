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
    create_appointment_in_n4(@gate_appointment)

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

  def create_appointment_in_n4 (gate_appointment)
    client = Savon::Client.new(wsdl: 'C:/N4/argobasic-service.wsdl', host: 'http://localhost:8280/apex/services/argobasicservice',  basic_auth: ["n4api", "lookitup"])
    client.call(:basic_invoke, message: { "scopeCoordinateIds" => 'OPR1/CPX11/FCY111/YRD1111', "xmlDoc" => '<gate>
        <create-appointment>
            <appointment-date>2022-12-06</appointment-date>
            <gate-id>TEST_GATE</gate-id>
            <truck license-nbr="IMRTRK" />
            <booking booking-nbr="TEST" line="APL" />
            <tran-type>RE</tran-type>
            <container eqid="APLU8989891" type="2200"/>
        </create-appointment>
    </gate>'})
  end

end
