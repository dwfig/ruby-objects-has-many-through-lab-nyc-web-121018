class Patient

  attr_accessor :name , :doctor, :appointment

  @@all = []

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor,date)
    Appointment.new(self,date, doctor)
  end

  def appointments
    ## should return an array of the patient's appointments
    # for every Appointment, which ones are mine?
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end

  def doctors
    ## for all the appointments I have, they're with which doctors?
    appointments.map do |appointment|
      appointment.doctor
    end
  end

end # <<-- end of Patient class
