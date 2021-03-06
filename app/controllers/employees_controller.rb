class EmployeesController < ApplicationController
  before_action :set_employee, :except => %i(index new create)

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new

    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @employee = Employee.new(employee_params)
    return unless @employee.save
    redirect_to employees_path,
                :notice => "Employee #{@employee.first_name} #{@employee.last_name} has been successfully created."
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    return unless @employee.update(employee_params)
    redirect_to employees_path,
                :notice => "Employee #{@employee.first_name} #{@employee.last_name} has been successfully updated."
  end

  def destroy
    if @employee.destroy
      flash[:notice] = "Employee #{@employee.first_name} #{@employee.last_name} has been successfully deleted."
    else
      flash[:alert] = "An error has occur while deleting employee #{@employee.first_name} #{@employee.last_name}."
    end
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit(
      :first_name,
      :last_name,
      :email,
      :phone,
      :department
    )
  end

  def set_employee
    @employee = Employee.find(params[:id])
  end
end
