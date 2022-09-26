class DoctorPatientsController < ApplicationController
  def destroy
    @doctor_patient = DoctorPatient.find(params[:id])
    @doctor = @doctor_patient.doctor
    DoctorPatient.destroy(@doctor_patient.id)
    redirect_to doctor_path(@doctor.id)
  end
end