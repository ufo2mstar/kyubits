# Amazon has a warehouse where they are trying to optimize employee scheduling.
#     Each work shift has a duration in hours and a queue of tasks with an estimated completion time
# and a minimum skill level.
#
#     Given a list of employees with their skill level and a work shift, code an algorithm that
# returns the employees that should come in
# for work.The solution should minimize the difference
#   between task minimum skill level and the employee’s skill level.
#
#       Example :
#
#       The morning shift is 4 hours and the tasks are:
#                                                      1.Packing boxes (skill level: 1, estimated duration: 3 hours),
#       2.Loading shelves (skill level: 3, estimated duration: 3 hours)
#   3.Taking out garbage (skill level: 1, estimated duration: 2 hours)
#
#   The available employees are:
#                               1.Jake, skill level 2
#   2.Melissa, skill level 3
#   3.Juanita, skill level 1
#
#   Result : [Melissa, Juanita]
#
#   Explanation : Loading shelves requires a skill level 3, so Melissa must be assigned that task.
#       That task takes 3 hours, so she has 1 more hour during her shift to complete tasks.
#       Packing boxes is a skill level 1, so Juanita is assigned the task.This task takes 3 hours so she has
#   1 more hour to complete tasks.The remaining task is taking out the garbage which takes 2 hours.
#       Both Melissa and Juanita have 1 hour remaining, so they each spend 1 hour taking out garbage
#   until the task is complete.


# class Task
#  -skill
#  -time
#
# class TaskList
#   get_next # give highest task skill,time
#
# class Employee
#   -skill
#   -time
#   -task_list

# class EmployeeList
#   -get_emp_with_skill skill
#   # handle closest skill level match
#   # prioritized is preselected employees


task_list = [2, 1, 3]
employee_list = [2, 1, 3]

def get_employee_list task_list, employee_list # variable shift handle
  res = [] # adeq emp

  until task_list.empty?
    next_task = task_list.get_next #2

    # todo: maybe look at preselected employees
    curr_employee = employee_list.get_emp_with_skill next_task.skill # get one emp # todo:  # emp: 2(4hrs)

    if curr_employee.time > next_task.time
      # remove task
      # update employee time

      # emp: 2(1hr) ,
    else
      # remove emp from employee_list
      # update task
    end

    # task_list: [1,3] employee_list: [2,1,3]

    raise EmployeesNotEnoughError if employee_list.empty? # todo: edge case: employees not enough

    res << curr_employee
  end


  res
end


