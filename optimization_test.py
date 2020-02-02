
## Optimization with glpk
# https://pypi.org/project/PuLP/

import numpy as np
from pulp import LpVariable, LpProblem, LpMinimize, GLPK, lpSum
import mysql.connector

## Connection to the database
config = {
  'user': 'root',
  'password': 'root',
  'unix_socket': '/Applications/MAMP/tmp/mysql/mysql.sock',
  'database': 'shotgun_website',
  'raise_on_warnings': True,
}


mydb = mysql.connector.connect(**config)


## Constant

# coefficient associated with the rank of choice
choice_coefficient = 3

# weight of an impossible choice
impossible_choice = 10000

## Constant taken from the database

# From table students
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM students")
myresult = mycursor.fetchall()
# information about each student
students = []
# number of hours each student want
number_hours = []
# language each student want to learn
language_wanted = []
for x in myresult:
    (id, surname, name, sport, year, hour_asked) = x
    students.append([id-1, surname, name, sport, year])
    number_hours.append(hour_asked)
    language_wanted.append([])
nb_students = len(students)

# From language_wanted
mycursor.execute("SELECT * FROM language_wanted")
myresult = mycursor.fetchall
for x in mycursor:
    (id, id_student, id_language) = x
    language_wanted[id_student - 1].append(id_language)
mycursor = mydb.cursor()

# From slots
mycursor.execute("SELECT * FROM slots")
myresult = mycursor.fetchall()
# slots_cources tells us what courses take place during a given hour
slots_courses = []
for x in myresult:
    slots_courses.append([])



# From cours
mycursor = mydb.cursor()
mycursor.execute("SELECT * FROM cours")
myresult = mycursor.fetchall()
# information about each course
courses = []
# capacitie of each course
capacities = []

# table of courses gathered by language
language_courses = [[] for i in range(10)]

for x in myresult:
    (id_cours, id_creneau, id_langue, level, name, teacher, capacity) = x
    courses.append([id_cours, id_creneau, id_langue, level, name])
    capacities.append(capacity)
    language_courses[id_langue].append(id_cours)
    slots_courses[id_creneau].append(id_cours)

number_courses = len(courses)

# From choices
# contains each choice of each student
choices = []

mycursor.execute("SELECT * FROM choices")
myresult = mycursor.fetchall()
for x in myresult:
    (id, id_student, id_class, rank) = x
    choices.append([id_student-1, id_class, rank])

# From sports
mycursor.execute("SELECT * FROM sports")
myresult = mycursor.fetchall()
# hour of each sport
sports = []
for x in myresult:
    (id, name, id_slot) = x
    sports.append(id_slot)


# Which year can choose wich course?
mycursor.execute("SELECT * FROM for_who")
myresult = mycursor.fetchall()
for_who = [[], [], []]
for x in myresult:
    (id, id_slot, id_year) = x
    for_who[id_year].append(id_slot)


def wrong_year(i, j):
    """"
    return true if a course j is not for a student's i year
    """
    student_year = students[i][4]
    for slot in for_who[student_year]:
        if slot == courses[j][1]:
            return False
    return True


def wrong_language(i, j):
    """
    Return true if a course j is not of a language a student i wants
    """
    wrong = True
    language_course = courses[j][2]
    for language in language_wanted[i]:
        if language == language_course:
            wrong = False
    return wrong


# list of weights given by each students to each courses
def create_weight(choices):
    """
    Create a table of weight according to the students' choices
    """
    # Create table
    a = 100
    weights = np.ones((nb_students, number_courses)) * a

    # Courses chosed
    for choice in choices:
        student = choice[0]
        course = choice[1]
        rank = choice[2]
        weights[student, course] = (rank-1)*choice_coefficient

    # Select impossible courses and give them a weight=impossible_choice
    for j in range(nb_students):
        for i in range(number_courses):
            sport = students[j][3]
            if courses[i][1] == sports[sport]:
                weights[j, i] = impossible_choice
            if wrong_year(j, i):
                weights[j, i] = impossible_choice
            if wrong_language(j, i):
                weights[j, i] = impossible_choice
    return weights

weight = create_weight(choices)

## Optimization

# initialising the problem
prob = LpProblem("Minimizing dissatisfaction", LpMinimize)

# variables
allocation = LpVariable.dicts("Allocation of the courses", ((i, j) for i in range(nb_students) for j in range(number_courses)), lowBound=0, upBound=1, cat='Integer')

# objective function
prob += lpSum([weight[i, j]*allocation[(i, j)] for i in range(nb_students) for j in range(number_courses)])

# constraints
for i in range(nb_students):
    # each student must have the number of lessons he asked for
    prob += lpSum([allocation[(i, j)] for j in range(number_courses)]) == number_hours[i]
    # each student must have at least one course of english
    prob += lpSum([allocation[(i, j)] for j in language_courses[0]]) >= 1
    # each student must have at least one course of another language
    prob += lpSum([allocation[(i, j)] for j in language_courses[0]]) <= number_hours[i] - 1
    # each student must have at the most 1 lesson per slot
    for slot in slots_courses:
        prob += lpSum([allocation[(i, j)] for j in slot]) <= 1
for j in range(number_courses):
    # a course cannot have more than the number a student he can host
    prob += lpSum([allocation[(i, j)] for i in range(nb_students)]) <= capacities[j]

# solve the problem
prob.solve()


import unittest


class TestImportData(unittest.TestCase):
    #Test if infromation is well imported from the database
    def test_students(self):
        self.assertEqual(students[1], [1, 'Wojcik', 'Camille', 5, 1])
    def test_courses(self):
        self.assertEqual(courses[54], [54, 5, 0, 0, 'Spotlight on Cinema'])  
    def test_slots_courses(self):
        self.assertEqual(slots_courses[2], [33, 34, 35, 36, 37, 38, 39, 40, 41, 42])     
    def test_capacities(self):
        self.assertEqual(capacities, [15 for i in range(nb_courses)])  
    def test_sports(self):
        self.assertEqual(sports[2], 15)
    def test_for_who(self):
        self.assertEqual(for_who[1], [0, 1, 2, 3, 4, 5, 6, 8, 9, 10, 11, 12, 13, 14])


class TestWeight(unittest.TestCase):
    def test_table_weight(self):
        #Check if table_weight have right value when a student rank a cours second
        self.assertEqual(create_weight([[1, 1, 2]])[1, 1],choice_coefficient*(2 - 1))
    def test_wrong_year(self):
        self.assertEqual(wrong_year(1, 1), False)
    def test_wrong_language(self):
        self.assertEqual(wrong_language(2, 4), False)

class TestOptimization(unittest.TestCase):
    def test_number_lesson_asked(self):
        #Check if the way constraints were implentend is working
        self.assertEqual(lpSum([allocation[(3, j)] for j in range(number_courses)]), number_hours[3])
if __name__ == '__main__':
    unittest.main()
