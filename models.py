from sqlalchemy.dialects.postgresql import JSON
from app import db

class User(db.Model):
    tablename = ['User']
    id = db.Column(db.Integer, primary_key=True)
    firstname = db.Column(db.String(200), nullable=False)
    lastname = db.Column(db.String(), nullable=False)
    phone = db.Column(db.String(200), nullable=False)
    email = db.Column(db.String(200), nullable=False)
    answers = db.Column(db.String(), default="Error in retrieving the answers")
    def __repr__(self):
        return f"User('{self.lastname}', '{self.email}', '{self.phone}')"


class TracerFormResponse(db.Model):
    tablename = ['tracer_form_response']
    id = db.Column(db.Integer, primary_key=True)
    value = db.Column(JSON, nullable=True) 
    
    def __repr__(self):
        return f"Tracer Response"


class Lecturer(db.Model):
    tablename = ['User']
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    department = db.Column(db.String())
    departmentSlug = db.Column(db.String())
    school = db.Column(db.String())
    schoolSlug = db.Column(db.String())
    phone = db.Column(db.String(), nullable=False)
    email = db.Column(db.String(), nullable=False)
    
    def __repr__(self):
        return f"Lecturer('{self.name}', '{self.email}', '{self.phone}')"


class Department(db.Model):
    tablename = ['Department']
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    school = db.Column(db.String())
    schoolSlug = db.Column(db.String())
    slug = db.Column(db.String())
    count = db.Column(db.Integer())
    hod = db.Column(db.String(), nullable=False)
    
    def __repr__(self):
        return f"Department('{self.name}')"

class School(db.Model):
    tablename = ['School']
    id = db.Column(db.Integer, primary_key=True)
    slug = db.Column(db.String())
    name = db.Column(db.String(), nullable=False)
    count = db.Column(db.Integer())  
    hod = db.Column(db.String(), nullable=False)
    
    def __repr__(self):
        return f"School('{self.name}', Slug('{self.slug}'))"


class CourseAllocation(db.Model):
    tablename = ['CourseAllocations']
    id = db.Column(db.Integer, primary_key=True)
    level = db.Column(db.String())
    courseCode = db.Column(db.String())
    courseTitle = db.Column(db.String())
    creditHours = db.Column(db.String())
    stream = db.Column(db.String())
    campus = db.Column(db.String())
    lecturer = db.Column(db.String())
    lecturerTitle = db.Column(db.String())
    lecturerStatus = db.Column(db.String())
    noOfStudents = db.Column(db.String())
    departments = db.Column(db.String())
    def __repr__(self):
        return f"CourseAllocation('{self.courseCode}', '{self.lecturer}', '{self.campus}')"


class LectureAssessment(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    lectureName = db.Column(db.String())
    lectureId = db.Column(db.String())
    department = db.Column(db.String())
    course = db.Column(db.String())
    semester = db.Column(db.String())
    classSize = db.Column(db.String())
    one = db.Column(db.String())
    two = db.Column(db.String())
    three = db.Column(db.String())
    four = db.Column(db.String())
    five = db.Column(db.String())
    six = db.Column(db.String())
    seven = db.Column(db.String())
    eight = db.Column(db.String())
    nine = db.Column(db.String())
    ten = db.Column(db.String())
    eleven = db.Column(db.String())
    twelve = db.Column(db.String())
    thirteen = db.Column(db.String())
    fourteen = db.Column(db.String())
    fifteen = db.Column(db.String())
    sixteen = db.Column(db.String())
    seventeen = db.Column(db.String())
    eighteen = db.Column(db.String())
    nineteen = db.Column(db.String())
    content = db.Column(db.String())
    attendance = db.Column(db.String())
    attendance = db.Column(db.String())


class Question(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    question = db.Column(db.String())
    skillGroup = db.Column(db.String())
    q_number = db.Column(db.String())
    component = db.Column(db.String())

class RegistrationForm(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    residence = db.Column(db.String())
    region = db.Column(db.String())
    gender = db.Column(db.String())
    age = db.Column(db.String())
    market = db.Column(db.String())
    recommendation = db.Column(db.String())
    nationality = db.Column(db.String())
    answers = db.Column(db.String())
    def __repr__(self):
        return f"User('{self.lastname}', '{self.email}', '{self.phone}')"

class SurveyForm(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String())
    startDate = db.Column(db.String(), default=None)
    endDate = db.Column(db.String(), default=None)
    ownerId = db.Column(db.String())
    status = db.Column(db.String())
    consumer = db.Column(db.String())
    slug = db.Column(db.String())
    family = db.Column(db.String())
    description = db.Column(db.String())
    type = db.Column(db.String())
    def __repr__(self):
        return f"Form('{self.name}', '{self.ownerId}')"

class SurveyQuestion(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    question = db.Column(db.String())
    family = db.Column(db.String())
    section = db.Column(db.String())
    type = db.Column(db.String())
    results = db.Column(db.String())

    def __repr__(self):
        return f"Question('{self.question}', '{self.family}', '{self.section}')"

class Section(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String())
    form = db.Column(db.String())
    questions = db.Column(db.String())

    def __repr__(self):
        return f"User('{self.lastname}', '{self.email}', '{self.phone}')"

class Responses(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    formName = db.Column(db.String())
    formId = db.Column(db.String())
    response = db.Column(db.String())

    def __repr__(self):
        return f"Response('{self.id}', '{self.formName}')"
