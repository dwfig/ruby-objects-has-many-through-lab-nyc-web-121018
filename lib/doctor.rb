class Doctor
  attr_reader :name
#  attr_accessor :appointments, :patients

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(date, patient)
    Appointment.new(date, patient, self)
  end

  def appointments
    # is an array of all the doctor's appointments
    # for ALL Appointments, select the ones for which this/self doctor
    # is the doctor
    Appointment.all.select do |appointment|
      appointment.doctor == self
    end
  end

  def patients
    # should be an array of patients the doctor has interacted with
    # out of those appointments that are this doctor's,
    # which patients have those appointments
    appointments.map do |appointment|
      appointment.patient
    end
  end

  # def patients
  #   appointments.map do |appointment|
  #     appointment.patient
  #   end
  # end


end # <<-- end of Doctor class
