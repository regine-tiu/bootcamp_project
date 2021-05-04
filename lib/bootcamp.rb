class Bootcamp
  def initialize(name, slogan, student_capacity)
    @name = name
    @slogan = slogan
    @student_capacity = student_capacity
    @teachers = []
    @students = []
    @grades = Hash.new{|hash,k| hash[k] = [] }

  end  

  def name
    @name
  end  

  def slogan
    @slogan
  end  

  def student_capacity
    @student_capacity
  end  

  def teachers
    @teachers
  end  

  def students
    @students
  end  

  def hire(new_teacher)
    @teachers << new_teacher
  end  

  def enroll(new_student)
    if @students.length < @student_capacity
     @students << new_student
      return true
    else 
      return false
    end    
  end 

  def enrolled?(student)
    @students.include?(student)
  end  

  def student_to_teacher_ratio
    (@students.length / @teachers.length).floor
  end  

  def add_grade(name, grade)
    if self.enrolled?(name)
      @grades[name] << grade
      return true
    else
      return false  
    end  
  end  

  def num_grades(name)
    return @grades[name].length
  end  

  def average_grade(name)
    if self.enrolled?(name) && self.num_grades(name) > 0
      total_grade = @grades[name].sum
      avg = total_grade / num_grades(name)
      return avg.round
    else
      return nil
    end  
  end  
end
