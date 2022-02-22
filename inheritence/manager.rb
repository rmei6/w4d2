require_relative "employee"

class Manager < Employee
  attr_reader :employees
  def initialize(name,title,salary,boss=nil)
    super
    @employees = []
  end

  def bonus(multiplier)
    salaries = []
    queue = Queue.new
    employees.each do |employee| queue.enq(employee) end
    until queue.empty?
      employee = queue.shift
      salaries << employee.salary
      if employee.is_a?(Manager)
        employee.employees.each do |employ| queue.enq(employ) end
      end
    end
    salaries.sum * multiplier
  end

  def add_employee(employee)
    employees << employee
  end
end

ned = Manager.new("Ned","Founder",1000000)
darren = Manager.new("Darren","TA Manager",78000,ned)
shawna = Employee.new("Shawna","TA",12000,darren)
david = Employee.new("David","TA",10000,darren)

ned.add_employee(darren)
darren.add_employee(shawna)
darren.add_employee(david)

p ned.bonus(5)
p darren.bonus(4)
p david.bonus(3)