## Optimization with glpk
# https://pypi.org/project/PuLP/

import numpy as np
from pulp import LpVariable, LpProblem, LpMinimize, GLPK, lpSum

## Constants

nb_students = 4
nb_courses = 2

slots_courses = [[0], [1]]
nb_slots = len(slots_courses)

capacities = 3*np.ones(nb_courses)

## Variable vectors (fill in with the students' requests)

# list of weights given by each students to each courses
weight = np.zeros((nb_students, nb_courses))
weight[0, 0] = 2
weight[0, 1] = 1
weight[1, 0] = 2
weight[1, 1] = 2
weight[2, 0] = 1
weight[2, 1] = 2
weight[3, 0] = 1
weight[3, 1] = 2

# list of number of lessons wanted for each students
nb_hours = np.ones(nb_students)

## Optimization

# initialising the problem
prob = LpProblem("Minimizing dissatisfaction", LpMinimize)

# variables
allocation = LpVariable.dicts("Allocation of the courses", ((i, j) for i in range(nb_students) for j in range(nb_courses)), lowBound=0, upBound=1, cat='Integer')

# objective function
prob += lpSum([weight[i,j]*allocation[(i,j)] for i in range(nb_students) for j in range(nb_courses)])

# constraints
for i in range(nb_students):
    # each student must have the number of lessons he asked for
    prob += lpSum([allocation[(i,j)] for j in range(nb_courses)]) == nb_hours[i]
    for slot in slots_courses:
        # each student must have at the most 1 lesson per slot
        prob += lpSum([allocation[(i,j)] for j in slot]) <= 1
for j in range(nb_courses):
    # a course cannot have more than the number a student he can host
    prob += lpSum([allocation[(i,j)] for i in range(nb_students)]) <= capacities[j]

# solve the problem
prob.solve()

# store and display the results
with open("allocation.txt",'w') as f:
    for student in range(nb_students):
        string_row = "student " + str(student) + " get courses"
        for course in range(nb_courses):
            if allocation[(i,j)] == 1:
                string_row += " " + str(course)
        string_row += "\n"
        # store
        f.write(string_row)
        # display
        print(string_row)