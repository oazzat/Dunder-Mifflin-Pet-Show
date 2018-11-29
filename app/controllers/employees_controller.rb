class EmployeesController < ApplicationController

  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
    @dogs = Dog.all
  end

  def show

  end

  def create
    @employee = Employee.create(employee_params)
    redirect_to @employee
  end

  def edit
    @dogs = Dog.all 
  end

  def update
    @employee.update(employee_params)
    redirect_to @employee
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end

  private
  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :img_url, :dog_id)
  end

end
