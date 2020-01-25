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
  db="essai"
)

## Constante
coef_choix=3

imposs = 10000

## Constante prise à partir de la base de donnée
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM students")
myresult = mycursor.fetchall()
students=[]
nb_hours=[]
language_wanted=[]
for x in myresult:
    (id, nom, prenom, sport, prom, hour_asked)=x
    students.append([id-1,nom, prenom,sport,prom,hour_asked])
    nb_hours.append(hour_asked)
    language_wanted.append([])
nb_students = len(students)

mycursor.execute("SELECT * FROM language_wanted")
myresult=mycursor.fetchall
for x in mycursor:
    (id, id_student, id_language)=x
    language_wanted[id_student-1].append(id_language)
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM slots")
myresult = mycursor.fetchall()
slots_courses=[]
for x in myresult:
    slots_courses.append([])

mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM cours")
myresult = mycursor.fetchall()
courses=[]
capacities=[]

# table of courses gathered by language
language_courses = [[] for in range(9)]

for x in myresult:
    (id_cours, id_creneau, id_langue, niveau, nom, enseignant, effectif)=x
    courses.append([id_cours, id_creneau, id_langue, niveau, nom])
    capacities.append(effectif)
    language_courses[id_langue].append(id_cours)
    slots_courses[id_creneau].append(id_cours)
    
nb_courses = len(courses)
nb_slots = len(slots_courses)

choices=[]

mycursor.execute("SELECT * FROM choices")
myresult= mycursor.fetchall()
for x in myresult:
    (id, id_student, id_class, rank)=x
    choices.append([id_student-1, id_class, rank])

        
mycursor.execute("SELECT * FROM sports")
myresult= mycursor.fetchall()
sports=[]
for x in myresult:
    (id, name, id_slot)=x
    sports.append(id_slot)


# Which year can choose wich course?
mycursor.execute("SELECT * FROM for_who")
myresult= mycursor.fetchall()
for_who=[[],[],[]]
for x in myresult:
    (id, id_slot, id_year)=x
    for_who[id_year].append(id_slot)

def wrong_year(i, j):
    student_year=students[i][4]
    for slot in for_who[student_year]:
        if slot==courses[j][1]:
            return False
    return True

def wrong_language(i, j):
    wrong=True
    language_course=courses[j][2]
    for language in language_wanted[i]:
        if language==language_course:
            wrong=False
    return wrong


# list of weights given by each students to each courses
def create_weight(choices):
    #Create table
    a=100
    weights=np.ones((nb_students, nb_courses))*a
    
    # Courses chosed 
    for choice in choices:
        student=choice[0]
        course=choice[1]
        rank=choice[2]
        weights[student, course]=(rank-1)*coef_choix

    # Impossible courses
    for j in range(nb_students):
        for i in range(nb_courses):
            sport=students[j][3]
            if courses[i][1]==sports[sport]:
                weights[j, i] = imposs
            if wrong_year(j,i):
                weights[j, i] = imposs
            if wrong_language(j,i):
                weights[j,i] = imposs

    
    return weights

weight=create_weight(choices)

    



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
    # each student must have at least one course of each language he put in his choice list
    for l in language_wanted[i]:
      prob += lpSum([allocation[(i,j)] for j in language_courses[l]]) >= 1
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
    string_row = "student " + students[student][1] + " " + students[student][2] + " get courses"
    for course in range(nb_courses):
        if int(allocation[(student,course)].value()) == 1:
            string_row += " " + courses[course][4] + ","
    print(string_row)

print("Dissatisfaction per student =",  prob.objective.value()/nb_students)
#print("choix =", choix)
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
