## Optimization with glpk
# https://pypi.org/project/PuLP/

import numpy as np
from pulp import LpVariable, LpProblem, LpMinimize, GLPK, lpSum
import mysql.connector

## Connection à la base de donnée
mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="root",
  db="site",
  socketPath : '/Applications/MAMP/tmp/mysql/mysql.sock', #only if you use MAMP
)

## Constante
nb_choix=4
coef_choix=3

## Constante prise à partir de la base de donnée
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM students")
myresult = mycursor.fetchall()
students=[]
for x in myresult:
    (id, nom, sport, prom)=x
    students.append([id,nom,sport,prom])
nb_students = len(students)

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM créneau")
myresult = mycursor.fetchall()
slots_courses=[]
for x in myresult:
    slots_courses.append([])

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM cours")
myresult = mycursor.fetchall()
courses=[]
capacities=[]
for x in myresult:
    (id_cours, id_creneau, id_langue, niveau, nom, enseignant, effectif)=x
    courses.append([id_cours, id_creneau, id_langue, niveau, nom])
    capacities.append(effectif)
    slots_courses[id_creneau].append(id_cours)
 
nb_courses = len(courses)
nb_slots = len(slots_courses)

choix=[]

for i in range(nb_students):
    for k in range(1,5):
        choix.append([i,np.random.randint(nb_courses),k])


imposs = 1000

## Variable vectors (fill in with the students' requests)

# list of weights given by each students to each courses
def create_weight(choices):
    #Create table
    a=int(coef_choix*nb_choix)
    weights=np.ones((nb_students, nb_courses))*a

    #Order choice 
    for choice in choices:
        student=choice[0]
        course=choice[1]
        rank=choice[2]
        weights[student, course]=(rank-1)*coef_choix


    return weights

weight=create_weight(choix)



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

# display the results
for student in range(nb_students):
    string_row = "student " + students[student][1] + " get courses"
    for course in range(nb_courses):
        if int(allocation[(student,course)].value()) == 1:
            string_row += " " + courses[course][4]
    print(string_row)

# store and display the results
# with open("allocation.txt",'w') as f:
#     for student in range(nb_students):
#         string_row = "student " + str(student) + " get courses"
#         for course in range(nb_courses):
#             if allocation[(i,j)] == 1:
#                 string_row += " " + str(course)
#         string_row += "\n"
#         # store
#         f.write(string_row)
#         # display
#         print(string_row)
