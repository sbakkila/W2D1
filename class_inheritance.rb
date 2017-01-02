class Employee

  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end



end

class Manager < Employee

  attr_reader :employees

   def initialize(name, title, salary, boss, *args)
  # def initialize (*arg)
     super(name, title, salary, boss)
     @employees = args
   end

   def bonus(multiplier)
     sum = 0

     @employees.each do |employee|
       if employee.is_a?(Manager)
         sum += employee.bonus(1) + employee.salary
       else
         sum += employee.salary
       end
     end

     sum * multiplier
   end

end

David = Employee.new('David', 'TA', 10000, 'Darren')
Shawna = Employee.new('Shawna', 'TA', 12000, 'Darren')
Darren = Manager.new('Darren', 'Manager', 78000, 'Ned', Shawna, David)
Ned = Manager.new('Ned', 'Founder', 1000000, nil, Darren)

p Ned.bonus(5)
p Darren.bonus(4)
p David.bonus(3)
