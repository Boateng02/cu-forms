from datetime import datetime
from email.message import EmailMessage
import pprint
import smtplib
from flask import Flask,redirect,url_for,render_template,request, flash, session, jsonify, json
from sqlalchemy import or_
from forms import *

from flask import Flask, render_template, request, jsonify
from flask_sqlalchemy import SQLAlchemy

from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.dialects.postgresql import JSON
from flask_migrate import Migrate

import urllib.request, urllib.parse
import urllib
from urllib.parse import urlencode
import requests
import csv
from sqlalchemy import func


app=Flask(__name__)
app.config['SECRET_KEY'] = '5791628b21sb13ce0c676dfde280ba245'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True
app.config['SQLALCHEMY_DATABASE_URI']= 'postgresql://postgres:new_password@45.222.128.55:5432/forms'

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///claims.db'
prestoBot = "5876869228:AAFk644pEKRBnEhZ6jbG2nXRlj4fsyZEYgg"
prestoUrl = "https://prestoghana.com"

app.app_context().push()

db = SQLAlchemy(app)
migrate = Migrate(app, db)

adminMail = ["mr.adumatta@gmai.com"]
superAdminMail = ["compliance.qualityassurance@central.edu.gh", "prestoghana@gmail.com"]

cusscoSuperAdmins = ['cuscu@central.edu.gh', 'prestoghana@gmail.com', 'jamiteye@central.edu.gh', 'benejune@gmail.com', 'graceturtcson04@gmail.com', 'onikosiadewale18@gmail.com','tetteyaddo@gmail.com']

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


class Staff(db.Model):
    tablename=['Staff']
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    phone = db.Column(db.String())
    staffId = db.Column(db.String())
    fileName = db.Column(db.String())
    email = db.Column(db.String())
    approved = db.Column(db.Boolean(), default=False)
    date_created = db.Column(db.DateTime, default=datetime.utcnow)


    def __repr__(self):
        return f"Staff {self.name}"


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
    date_created = db.Column(db.DateTime, default=datetime.utcnow)
    
    def __repr__(self):
        return f"Lecturer('{self.name}', '{self.email}', '{self.phone}')"


class Department(db.Model):
    tablename = ['Department']
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(), nullable=False)
    school = db.Column(db.String())
    schoolSlug = db.Column(db.String())
    slug = db.Column(db.String())
    count = db.Column(db.String())
    hod = db.Column(db.String(), nullable=False)
    date_created = db.Column(db.DateTime, default=datetime.utcnow)

    
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
    session = db.Column(db.String())
    classSize = db.Column(db.String())
    # courseAllocationId = db.Column(db.Integer)
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
    date_created = db.Column(db.DateTime, default=datetime.utcnow)


    def __repr__(self):
            return f"LecturerAssessment('{self.course}', '{self.semester}','{self.classSize}', '{self.lectureName}')"

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
    

class Claims(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    lecturer_name = db.Column(db.String(255))
    course = db.Column(db.String(255))
    academic_year = db.Column(db.String(200))
    semester = db.Column(db.String(50))
    month = db.Column(db.String(50))
    date = db.Column(db.String(50))
    _class = db.Column(db.String(50))
    hours = db.Column(db.Integer)
    total_hours = db.Column(db.Integer)
    tax_amount = db.Column(db.Float)
    amount_before_tax = db.Column(db.Float)  # Add this line
    amount_after_tax = db.Column(db.Float)
    total_amount_due = db.Column(db.Float)
    transport_allowance = db.Column(db.Float)  # Add this line


    

def sendtelegram(params, e="None"):
    params + "\n" + e
    print(e)
    url = "https://api.telegram.org/bot1699472650:AAEso9qTbz1ODvKZMgRru5FhCEux_91bgK0/sendMessage?chat_id=-511058194&text=" + urllib.parse.quote(params)
    content = urllib.request.urlopen(url).read()
    print(content)
    return content



@app.route('/claim')
def claim_form():
    return render_template('claim_form.html')

@app.route('/submit', methods=['POST'])
def submit_claim():
    if request.method == 'POST':
        lecturer_name = request.form['lecturer_name']
        course = request.form['course']
        academic_year = request.form['academic_year']
        semester = request.form['semester']
        month = request.form['month']
        amount_before_tax = float(request.form['amount_before_tax'])
        transport_allowance = float(request.form['transport_allowance'])
        dates = request.form.getlist('date[]')
        classes = request.form.getlist('class[]')
        hours = request.form.getlist('hours[]')

        total_hours = 0
        tax_rate = 0.15
        tax_amount = amount_before_tax * tax_rate
        amount_after_tax = amount_before_tax - tax_amount
        total_amount_due = amount_after_tax + transport_allowance

        for i in range(len(dates)):
            date = dates[i]
            _class = classes[i]
            hour = int(hours[i])
            total_hours += hour

            claim = Claims(
                lecturer_name=lecturer_name,
                course=course,
                academic_year=academic_year,
                semester=semester,
                month=month,
                date=date,
                _class=_class,
                hours=hour,
                    amount_before_tax=float(request.form['amount_before_tax']),
        transport_allowance=float(request.form['transport_allowance']),
                total_hours=total_hours,  # Store total_hours in the database
                tax_amount=tax_amount,  # Store tax_amount in the database
                amount_after_tax=amount_after_tax,  # Store amount_after_tax in the database
                total_amount_due=total_amount_due  # Store total_amount_due in the database
            )

            db.session.add(claim)

        db.session.commit()

        return jsonify({
            "message": "Claim submitted successfully",
            "total_hours": total_hours,
            "tax_amount": tax_amount,
            "amount_after_tax": amount_after_tax,
            "total_amount_due": total_amount_due
        })

@app.route('/', methods=['GET','POST'])
def landing():
    form = SurveyForm.query.all()
    print(form)
    return render_template('satc.html', form=form)

@app.route('/alumni', methods=['GET','POST'])
def alumni():
    return render_template('alumni.html')

@app.route('/404', methods=['GET','POST'])
def server():
    return render_template('server.html')

@app.route('/mail', methods=['GET','POST'])
def mail():
    return render_template('server.html')

@app.route('/new', methods=['GET','POST'])
def new():
    return render_template('newui.html')

@app.route('/newdep', methods=['GET','POST'])
def newdepartment():
    return render_template('newdepartment.html')

@app.route('/stafflist', methods=['GET', 'POST'])
def stafflist():
    staff = Staff.query.all()
    staffArray = [s.name for s in staff]
    print(staffArray)
    return {"data":staffArray}

@app.route('/bio', methods=['GET','POST'])
def bio():
    form = StaffBio()
    form.name.choices = [(staff.name, staff.name) for staff in   Staff.query.all()]
    print(form.data)
    if request.method == 'POST':

        staff = Staff.query.filter_by(name=form.name.data).first()
        if staff != None:
            staff.name = form.name.data
            staff.staffId = form.staffid.data 
            staff.phone = form.phone.data
            staff.email=form.email.data
            try:
                db.session.commit()
            except Exception as e:
                reportError(e)
            message = f"Hello {staff.name} your data has been sent to Administrator to be approved. You will recieve an email containing the requested data withing 24 - 48 hours. \n \nPowered By PrestoGhana."
            # send_sms(form.phone.data,message)
            print(type(cusscoSuperAdmins))
            print(cusscoSuperAdmins)
            sendAnEmail("CUSCCU Bio Data",form.name.data,render_template("biomail.html", data=staff), cusscoSuperAdmins )
            return render_template('success.html', message = message, loadingMessage="Uploading your details.")
        else:
            print(form.errors)
            reportError(form.errors)
            print(f'There was no user with this name.')
            flash(f'There was no user with this name.')
    return render_template('bio.html', form=form, loadingMessage="Uploading your details.", title = "CUSSCO User Data Entry", description="Easily submit your data through Central University's CUSSCO Data Entry Portal. Your information will be swiftly validated, and once approved, your statement will be sent to the email address you provide, ensuring a seamless user experience.")


@app.route('/uploadbiodata', methods=['GET', 'POST'])
def uploadbiodata():
    pprint.pprint(request.json)
    print(type(request.json))

    data = request.json
    staff = data["data"]

    print(type(staff))

    newUsers = []
    existingUsers = []

    for i in staff:
        print(i)
        if Staff.query.filter_by(name=i).first() == None:
            newStaff = Staff(name = i, fileName = i)
            db.session.add(newStaff)
            newUsers.append(i)
        else:
            existingUsers.append(i)
            print("This user is already there")

    db.session.commit()

    responseBody = {
        "newUsers":newUsers,
        "existingUser":existingUsers,
        "newTotal":len(newUsers),
        "existingTotal":len(existingUsers)
    }
    return responseBody

@app.route('/success', methods=['GET','POST'])
def success():
    return render_template('success.html', message = "Your form was submitted successfully. Your data has also been recorded for future communication. We are proud of you.")

@app.route('/biomail', methods=['GET','POST'])
def biomail():
    return render_template('biomail.html')

# @app.route('/decline/<int:staffId>', methods=['GET', 'POST'])

# @app.route('/updateStaffDetails', methods=['GET', 'POST'])
# def updateStaffDetails():
#     for s in Staff.query.all():
#         s.fileName = s.name
#     db.session.commit()
#     return "Details Successfully Accepted"

@app.route('/confirmation/<int:staffId>', methods=['GET', 'POST'])
def confirmUser(staffId):
    staff = Staff.query.get_or_404(staffId)

    print("Initialising confirmation function for staff")
    print(staff)

    try:
        staff.approved = True
        db.session.commit()
    except Exception as e:
        reportError(e)
    
    if staff.email:
        if staff.fileName:
            print(staff.email)
            path = "contributions/"+staff.fileName+".pdf"
            # cusscoSuperAdmins.append(staff.email)
            sendAnEmail("CUSSCU Statement", staff.name+" CUSSCU Statement", "Please find attatched your CUSSCU statement.", [staff.email] ,path=path)
        else:
            return render_template('error.html', message = "This user doesnt have a statement in our records")
    
    if staff.phone:
        send_sms(staff.phone,"Hi " + staff.name + "\n Your statement has been forwarded to your email address: "+ str(staff.email) + " if you have any trouble you can reach out to +233256576606")

    return render_template("success.html", message = "Your data has been sent to the Administrator to be approved! <br> You will recieve an email containing the requested data withing 24 - 48 hours.")

@app.route('/session', methods=['GET','POST'])
def session():
    return render_template('session.html')

@app.route('/size', methods=['GET','POST'])
def size():
    return render_template('size.html')

@app.route('/tracer',methods=['GET','POST'])
def tracer():
    tracerDescription = 'Dear Graduate, Through this questionnaire CU aims to track its graduates and receive feedback regarding the type of work, further study or other activity you are/have been involved in since you completed your study from Central University. The information provided will assist the institution to plan both for future educational needs and improve its programmes. Results of this tracer study will only be presented in summary form and individual responses will be kept strictly confidential. We would, therefore, highly appreciate if you could complete the following questionnaire and return it to us, at your earliest convenience. Thank you for your kind cooperation and support.'
    form = ContactForm()

    if request.method == 'POST':
        if form.validate_on_submit():
            print("firing form")
            try:
                message = "From: " + form.name.data + "\nPhone: " + form.number.data + "\nMessage: " + form.message.data
                print("message")
                print(message)
                prestoUrl
                r = requests.get(prestoUrl+'/sendPrestoMail?recipient=compliance.qualityassurance@central.edu.gh&subject='+form.name.data+'&message='+message)
                print(r.url)
                flash('Hi, ' + form.name.data +' your message has been submitted successfully.','success')
            except Exception as e:
                print(e)
                print("Unable to send emails!")
                flash('Oops, there was an error sending your email, please check and try again.','fail')
            return redirect(url_for('tracer'))
        else:
            print(form.errors)

    return render_template('tracerlanding.html',hideNav=False, form=form, title="Alumni Tracer Form ", description="Central University is conducting a tracer study to gather feedback from its graduates about their post-study activities. Please complete the questionnaire to assist in planning future educational needs while ensuring confidentiality of your responses.")

@app.route('/allSurveys')
def allSurveys():
    # flash(f'Thanks for filling this out', 'success')
    form = SurveyForm.query.all()
    return render_template('allSurveys.html', form=form)

@app.route('/info/<int:formId>', methods=['GET','POST'])
def home(formId):
    session['qNumber'] = 1
    form = RegistrationForms()  
    if form.validate_on_submit():
        residence = form.residence.data
        region = form.region.data
        gender = form.gender.data
        age = form.age.data
        nationality = form.nationality.data
        market = form.market.data
        recommendation = form.recommendation.data
        newRegistration = RegistrationForm( residence = residence, gender = gender, age = age, nationality = nationality, market = market, region = region, recommendation = recommendation)
        db.session.add(newRegistration)
        db.session.commit()
        return redirect(url_for('survey', formId = formId))
    return render_template('index.html', form=form)

@app.route('/dashboard', methods=['GET', 'POST'])
def dashboard():
    forms = SurveyForm.query.filter_by(ownerId = '1').count()
    total = LectureAssessment.query.count()
    departments = Department.query.count()
    lecturers = Lecturer.query.count()
    schools = School.query.count()
    courseAllocation = CourseAllocation.query.count()
    return render_template('dashboard.html', schools=schools, departments=departments, lecturers=lecturers, courseAllocations=courseAllocation, title="Dashboard", total=total, forms = forms)

@app.route('/uploadCsv', methods=['GET', 'POST'])
def uploadCsv():
    if request.method == 'POST':
         # Read the File using Flask request
        file = request.files['file']
        file.filename = "CourseAllocationsEdit.csv"
        # save file in local directory
        file.save(file.filename)
        print(file.filename)
        return fetchCourseAllocation()
    return render_template('uploadCsv.html')

currentUser = "1"
@app.route('/myforms', methods=['GET', 'POST'])
def myforms(): 
    forms = SurveyForm.query.filter_by(ownerId = currentUser).order_by(SurveyForm.id.desc()).all()
    return render_template('myforms.html', title="My Forms", forms = forms)

# @app.route('/update/<intId>', methods=['GET', 'POST'])
# def updateQuestion(id):
#     form = NewQuestion()
#     question = SurveyQuestion.query.get_or_404(id)
#     print(question)
#     if form.validate_on_submit:
#        question = form.question.data
#        db.session.commit()
#        flash(f'Question has been updated.')
#     return redirect(url_for('adminform', formId=question.family))

# @app.route('/delete/<int:question>', methods=['GET', 'DELETE'])
# def deleteQuestion(question):
#     question = SurveyQuestion.query.get_or_404(question)
#     db.session.delete(question)
#     db.session.commit()
#     print(question)
#     return redirect(url_for('adminform', formId=question.family))


@app.route('/deleteForm/<int:formId>', methods=['GET', 'DELETE'])
def deleteForm(formId):
    form = SurveyForm.query.get_or_404(formId)
    db.session.delete(form)
    db.session.commit()
    print(form)
    return redirect(url_for('myforms'))

@app.route('/admin/<string:formId>', methods=['GET', 'POST'])
def adminform(formId):
    # find form by slug
    form = NewQuestion()
    surveyForm = SurveyForm.query.get_or_404(formId)
    formtitle = surveyForm.name
    print(surveyForm)
    if request.method == 'POST':
        questions = SurveyQuestion.query.filter_by(family = formId).order_by(SurveyQuestion.id.desc()).all()
        if form.validate_on_submit():
            newSurveyQuestion = SurveyQuestion(family = formId, question = form.question.data)
            try:
                db.session.add(newSurveyQuestion)
                db.session.commit()
                return redirect(url_for('adminform', formId=formId))
            except:
                print(form.errors)
                flash( f'There was an error uploading this question', "warning")
        else:
            print(form.errors)
    elif request.method == 'GET':
        questions = SurveyQuestion.query.filter_by(family = formId).order_by(SurveyQuestion.id.desc()).all()
    return render_template('adminformedit.html', questions=questions, formtitle=formtitle, form=form, survey=surveyForm, title="My Forms")

@app.route('/adminresponses/<int:id>', methods=['GET', 'POST'])
def adminresponses(id):
    print(id)
    response = LectureAssessment.query.get_or_404(id)
    print("response: ")
    print(response)
    
    # questions = SurveyQuestion.query.filter_by(family = response.formId).all()
    # print("questions: ")
    # print(questions)

    # formTitle = SurveyForm.query.filter_by(family = response.formId).first()
    # print(formTitle)

    
    # response = json.loads(response.response)
    # print(type(response))
    # for q in questions:
    #     try:
    #         print(q.id)
    #         print(q.question)
    #         print(response[q.id])
    #     except:
    #         print("There was a problem!")

    print("surveyForm")
    # find response!
    print("response")
    # return response
    return render_template('adminform.html', questions = "questions", response = response, formtitle=response.lectureName, title="Responses")

@app.route('/newForm', methods=['GET', 'POST'])
def newForm():
    # create a new forms
    form = NewForm()
    consumers = ["None","Students", "Alumni", "Staff", "All"]
    if request.method == 'POST':
        print("POST REQUEST")
        if form.validate_on_submit():
            newform = SurveyForm(ownerId=currentUser, name = form.name.data,description = form.description.data, consumer = request.form.get("answer"))
            try:
                db.session.add(newform)
                db.session.commit()
            except:
                print("Unable to create new form")
            return redirect(url_for('adminform',formId=newform.id))
        else:
            print(form.errors)
    else:
        print(form.errors)
    return render_template('newForm.html', form=form, consumers=consumers)

@app.route('/admin/add/<int:form>', methods=['GET', 'POST'])
def addNewQuestion(form):
    print(form)
    return redirect(url_for('adminform', form=form))

@app.route('/adduser',methods=['POST'])
# @cross_origin() 
def adduser():
    newUser = User(firstname=request.json['firstname'], lastname=request.json['lastname'], phone=request.json['phone'], email=request.json['email'], answers="None")
    print('From react')
    print(newUser)
    return render_template('adminpage.html')

@app.route("/ussd", methods = ['GET','POST'])
def ussd():
  session_id   = request.values.get("sessionId", None)
  serviceCode  = request.values.get("serviceCode", None)
  phone_number = request.values.get("phoneNumber", None)
  text         = request.values.get("text", "")

#   session_id   = "sessionId"
#   serviceCode  = "serviceCode"
#   phone_number = "phoneNumber"
#   text         = "1"

  if text == '':
      print("text" + text)
      # This is the first request. Note how we start the response with CON
      response  = "CON Welcome to Shell, what would you like to do today \n"
      response += "1. Pay for fuel \n"
      response += "2. Join Loyalty Program"

  elif text    == '1':
      # Business logic for first level response
      print("text" + text)

      response  = "CON Please enter the attendants code \n"
    #   response += "1. Account number"

  elif text   == '2':
      print("text" + text)

      # This is a terminal request. Note how we start the response with END
      response = "END Your phone number is " + phone_number

  elif text          == '1*1':
      print("text" + text)

      # This is a second level response where the user selected 1 in the first instance
    #   accountNumber  = "ACC1001"
      # This is a terminal request. Note how we start the response with END
      response       = "Please enter the amount fuel you are buying? " 

  else :
      response = "END Invalid choice"

  # Send the response back to the API
  return response

# @app.route("/phone/<string:phonenumber>")
# def phone(phonenumber):
#     credentials = 'selasi@delaphonegh.com', '3AsX3Jz7u28NV6U'
#     session = requests.Session()
#     session.auth = credentials

#     os.system("zoiper")

#     params = {
#         'query': 'role:end-user phone:'+phonenumber,
#         'sort_by': 'created_at',
#         'sort_order': 'asc'
#     }

#     url = 'https://delaphonegh.zendesk.com/api/v2/search.json?' + urlencode(params)
#     response = session.get(url)
#     if response.status_code != 200:
#         print('Status:', response.status_code, 'Problem with the request. Exiting.')
#         exit()

#     # Print the subject of each ticket in the results
#     data = response.json()
#     for result in data['results']:
#         userId = result['id']
#         userName = result['name']
#         print(userId)
#         print(userName)
#         webbrowser.open("https://delaphonegh.zendesk.com/agent/users/"+str(userId))

#     return phonenumber

@app.route('/testPost/<string:number>', methods=['POST','GET'])
def testPost(number):
    print("gotten requestio")
    print(number)
    # point = int(request.data[ adj ])
    print(request.data)
    return "DONE"

@app.route('/users', methods=['POST','GET'])
def users():
    users = User.query.all()
    allusers = dict.fromkeys(users)
    # allusers = us /ers 
    # users = [{'id':1, 'name':'Kweku'},{'id':2, 'name':'Nana'}]
    print(type(users))
    print(type(allusers))
    print(allusers)
    # return json({'users':users})
    return str(users)

    # return json.dumps(
    #     {'users':users}
    # )
    # response = app.response_class(
    #     response=json.dumps(
    #         [
    #             {
    #         username:users.firstname,
    #         email:users.email,
    #        id:users.id
    #             }
    #         ]
    #     ),
    #     mimetype='application/json'
    # )
    # return response

@app.route('/signup', methods=['POST','GET'])
def signup():

    return "Signup"

@app.route('/forms')
def forms():
    questions = Question.query.order_by(Question.id.asc()).all()
    set1 = []
    set2 = []
    set3 = []
    for question in questions:
        if question.id <= 7:
            set1.append(question)
        if  8 <= question.id <= 14:
            set2.append(question)
        if  15 <= question.id <= 22:
            set3.append(question)
        print(set3)
        # while 7 < question.id < 14:
        
    learnerCentricity = set1
    # learnerCentricity = Question.query.filter_by(skillGroup = "Learner Centricity").all()
    teachingForRecall = set2
    # teachingForRecall = Question.query.filter_by(skillGroup = "Teaching for Recall").all()
    teachingForEngagement = set3
    # teachingForEngagement = Question.query.filter_by(skillGroup = "Teaching for Engagement").all()
    totalquestions = len(questions)
    return render_template('forms.html', questions = questions, totalquestions=totalquestions, learnerCentricity=learnerCentricity, teachingForRecall=teachingForRecall, teachingForEngagement=teachingForEngagement )

@app.route('/admin')
def admin():
    questions = Question.query.all()
    totalquestions = len(questions)
    return render_template('admin.html', questions = questions, totalquestions = totalquestions)

@app.route('/admin/questions')
def adminquestions():
    questions = Question.query.all()
    print(questions)
    return render_template('questions.html', questions = questions)

@app.route('/admin/addquestion', methods=['GET','POST'])
def addquestion():
    form = Questions()
    if form.validate_on_submit():
        new_question = Question(question=form.question.data, skillGroup = form.skillGroup.data, q_number=form.q_number.data, component =form.component.data )
        db.session.add(new_question)
        db.session.commit()
        print("It submits")
        return redirect (url_for('admin'))
    return render_template('addaquestion.html', form=form)

def send_sms(phone,message):
    params = {"key":'aniXLCfDJ2S0F1joBHuM0FcmH',"to":phone,"msg":message,"sender_id":'PrestoSL'}
    url = 'https://apps.mnotify.net/smsapi?'+ urllib.parse.urlencode(params)
    content = urllib.request.urlopen(url).read()
    print (content)
    print (url)

@app.route('/newreport', methods=['GET','POST'])
def newreport():
    code = "ajlsbdf312wiubc"
    message = 'Your clearance code is: ' + code
    return render_template('newreport.html')

# @app.route("/sendMail")
# def index():
#    print("Initiating sending mail")
#    msg = Message('Hello', sender = 'prestoghana@gmail.com', recipients = ['dev.lecturesoft@gmail.com'])
#    msg.body = "Hello Flask message sent from Flask-Mail"

#    print(msg)
#    mail.send(msg)
#    return "Sent"

# @app.route('/forex')    
# def forex():
#     url = "https://api.apilayer.com/currency_data/convert?to=GBP&from=USD&amount=5"

#     payload = {}
#     headers= {
#     "apikey": "KggjPZDWQHGB8eHxmWefEkeH1JiKUogx"
#     }

#     response = requests.request("GET", url, headers=headers, data = payload)

#     status_code = response.status_code
#     result = response.text
#     print(result)
#     return result

@app.route('/myresponses', methods=['GET', 'POST'])
def myresponses():
    responses = LectureAssessment.query.order_by(LectureAssessment.id.desc()).all()
    surveys = SurveyForm.query.all()
    return render_template('myresponses.html', title = "Responses", responses = responses, surveys = surveys)


# --------- UPDATE DATA QUERIES ---------------

@app.route('/updatedepartments', methods=['GET', 'POST'])
def updatedepartments():

    # for l in Department.query.all():
    #     db.session.delete(l)
    #     db.session.commit()

    message = "Successful"

    # responses = Departments.query.all()
    result = db.session.query(CourseAllocation.departments, func.count(CourseAllocation.id)).group_by(CourseAllocation.departments).all()
    # result = db.session.query(CourseAllocation.school, CourseAllocation.departments, func.count(CourseAllocation.id)).group_by(CourseAllocation.school, CourseAllocation.departments).all()
    print("FETCHING ALL COURSE ALLOCATIONS")
    pprint.pprint(result)

    print(type(result))

    for r in result:
        department = r[0]

        if department != "":
            print(department)
            print("--------------------------")
            print("Checking if " + department + " already exitst")

            existingDepartment = Department.query.filter_by(name=department).first()
            print(existingDepartment)

            if existingDepartment == None:
                print("Attempting to create" + department + " department")

                print(existingDepartment)
                
                try:
                    newdepartment = Department(name=department, school="school", slug=department.replace(' ', '_').lower() , hod="N/A")
                    db.session.add(newdepartment)
                    db.session.commit()
                except Exception as e:
                    message = e
                    print(e)
                    break
    
    return message

# TODO:
# @app.route('/generateExcel', methods=['GET', 'POST'])
# def generateExcel():

#     timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")

#     # Construct the CSV filename with the timestamp
#     csv_filename = f"output_data_{timestamp}.csv"

#     # Open the CSV file in write mode
#     with open(csv_filename, mode='w', newline='') as csv_file:
#         # Create a CSV writer
#         csv_writer = csv.writer(csv_file)

#         for assessment in LectureAssessment.query.filter_by(naem="x").all()
        
#         # Write the data from the array into the CSV file
#         csv_writer.writerows(data)

#     return "Done"

@app.route('/updateCourses', methods=['GET', 'POST'])
def updateCourseAllocationsToActualCourses():
    responses = LectureAssessment.query.all()
    for r in responses:
        print("----- LECTURE -----")
        print(r.lectureName, r.department, r.semester, r.classSize, r.course)
        print("----- RESPONSE COURSE -----")
        print(r.course)
        print("----- COURSE - ALLOCATION -----")
        course = CourseAllocation.query.filter_by(lecturer = r.lectureName, departments = r.department)
        print(course.count())
        allcourses = course.all()
        for c in allcourses:
            if r.course.find(c.courseCode) != -1 and r.course.find(c.courseTitle) != -1:
                print(c.courseTitle)
            # print(c.courseCode + " + " + c.courseTitle)
            # print(r.course.find(c.courseCode), r.course.find(c.courseTitle))
        print("------------- END -------------")
    return "done."


@app.route('/updateschoolcount')
def updateschoolcount():
    # find all department by an aggregated slug

    for s in School.query.all():
        total = 0
        for d in Department.query.all():
            if (s.slug == d.schoolSlug):
                total += 1
            else:
                print("Next")
        d.count = str(total)
        db.session.commit()
    return "Done"

@app.route('/filterLecturers', methods=['GET', 'POST'])
def filterLecturers():
    notLecturers = []
    for l in Lecturer.query.all():
        print("-------------")
        print(l)
        if l.name == "" or l.name == " " or l.name == None:
            print("This is a null value!")
            notLecturers.append(l)
            db.session.delete(l)
        print(len(notLecturers))
        print((notLecturers))
        pprint.pprint(notLecturers)
    db.session.commit()
    return "en(notLecturers)"


@app.route('/updatelecturers', methods=['GET', 'POST'])
def updatelecturers():
    message = "Successful"

    print("Deleteing Lecturers:")

    for l in Lecturer.query.all():
        print(l.name)
        db.session.delete(l)
    db.session.commit()

    print("Done Deleting Lecturers:")
    # responses = Departments.query.all()
    # result = db.session.query(CourseAllocation.departments, func.count(CourseAllocation.id)).group_by(CourseAllocation.departments).all()
    result = db.session.query(CourseAllocation.lecturer, CourseAllocation.departments,   func.count(CourseAllocation.id)).group_by(CourseAllocation.lecturer, CourseAllocation.departments).all()

    print(result)

    print(type(result))

    print("Inititing lecturer data dump")

    for r in result:
            
        print("------------------")
        print(r)
        print("------------------")

        lecturer = r[0]
        department = r[1]

        print("Department: " + department + " Lecturer: " + lecturer)

        if department != None or lecturer != None:

            try:
                department = Department.query.filter_by(name=department).first() 
                school =  School.query.filter_by(name = department.school).first()

                if school != None:
                    
                    print(department.slug +  " - " + school.slug + " - " + lecturer )
                    print("-------------------------------!")
                    print("Checking if "+ lecturer + " already exists")

                    existingLecturer = Lecturer.query.filter_by(name=lecturer, department=department.name, school = school.name, schoolSlug = school.slug).first()
                    if existingLecturer == None:
                        print("Adding new lecturer: "+ lecturer)

                        try:
                            newLecturer = Lecturer(name=lecturer, department=department.name, departmentSlug=department.slug, school = school.name, schoolSlug=school.slug, phone="N/A", email="N/A" )
                            db.session.add(newLecturer)
                            db.session.commit()
                        except Exception as e:
                            message = e
                            print(e)
                            break

                    else:
                        print(lecturer + " already exists")

            except Exception as e:
                print(e)   
    return message

@app.route('/updatedDepartmentWithSchool', methods=['GET', 'POST'])
def updatedDepartmentWithSchool():
    alldepartments = Department.query.all()
    print(alldepartments)

    for d in alldepartments:
        school = School.query.filter_by(slug=d.schoolSlug).first()
        print("Updating " + d.school + " school to " + school.name)
        try:
            d.school = school.name
            print(d.school + " - " + school.name)
            db.session.commit()
        except Exception as e:
            print(e)
    return "sdf"

@app.route('/updateSchoolCount', methods=['GET', 'POST'])
def updateSchoolCount():
    for s in School.query.all():
        s.count = Department.query.filter_by(schoolSlug = s.slug).count()
        db.session.commit()
    return "SchoolCount Updated"



@app.route('/myresponse/<int:id>', methods=['GET', 'POST'])
def myresponse(id):
    response = LectureAssessment.query.get_or_404(id)
    return render_template('myresponse.html')


dict = {}

@app.route('/restartForm/<int:formId>')
def restartForm(formId):
    session['qNumber'] = 1
    dict = {}
    return redirect(url_for('survey', formId=formId))

@app.route('/reverseForm/<int:formId>')
def reverseForm(formId):
    session['qNumber'] = int(session['qNumber']) - 1
    return redirect(url_for('survey', formId=formId))

@app.route('/testresponse', methods=['GET', 'POST'])
def testresponse():
    response = Responses.query.all()
    response = response[-1].response
    print(response)
    print(type(response))
    return json.loads(response)

@app.route('/testtally/<string:formId>', methods=['GET', 'POST'])
def testtally(formId):
    responses = Responses.query.filter_by(formId = formId).all()
    for response in responses:
        print(response)
    return "responses"

@app.route('/report/<int:id>', methods=['GET', 'POST'])
def formReport(id):
    form = SurveyForm.query.get_or_404(id)
    print(form)

    questions = SurveyQuestion.query.filter_by(family = id).all()

    return render_template('formReport.html', questions=questions)

@app.route('/formatResult')
def formatResult():
    questions = SurveyQuestion.query.all()
    result = {}
    for q in questions:
        result = {}
        print(json.dumps(result) + " - " + str(type(result)))

    return str(type(result))


@app.route('/alllectures', methods=['GET', 'POST'])
def alllectures():
    array = []
    
    lectureres = Lecturer.query.all()
    for l in lectureres:
        array.append(l.name.strip())

    # remove duplicates
    array = list(dict.fromkeys(array))
    response = {
        "data":array
    }
    return response

@app.route('/fetchCourseAllocation', methods=['POST', 'GET'])
def fetchCourseAllocation():
    with open('CourseAllocationsEdit.csv', 'r') as csv_file:
        csv_reader = csv.DictReader(csv_file)

        responseArray = []

        # for c in CourseAllocation.query.all():
        #     print(c)
        #     db.session.delete(c)
            #  db.session.commit()

        next(csv_reader)

        for line in csv_reader:
            # print("316" + "/" + line["No."])
            print("------------------------------")
            responseArray.append(line)

            # Course Allocation
            newCourseAllocation = CourseAllocation(
                level = line["Level"],
                courseCode = line["CourseCode"],
                creditHours = line["CreditHrs"],
                courseTitle = line["CourseTitle"],
                stream = line["Stream"],
                campus = line["Campus"],
                lecturer = line["Lecturer"].strip(),
                lecturerStatus = line["LecturerStatus"],
                lecturerTitle = line["LecturerTitle"],
                noOfStudents = line["NoOfStudents"],
                departments = line["Department"]
            )
            print(newCourseAllocation)
            db.session.add(newCourseAllocation)

            newLecturer = Lecturer(
                name = line["Lecturer"],
                phone = "N/A",
                email = "N/A"
            )
            db.session.add(newLecturer)

        db.session.commit()

        response = {
            "body":responseArray
        }
        print(type(response))
    return response

@app.route('/survey/<int:formId>', methods=['GET', 'POST'])
def survey(formId):
    formId = formId
    if session['qNumber']:
        print("Found a session")
    else:
        session['qNumber'] = 1

    allQuestions = SurveyQuestion.query.filter_by(family = formId).order_by(SurveyQuestion.id.asc()).all()

    rows = len(allQuestions)
    print(rows)
    
    currentQuestion = session['qNumber']
    currentQuestionPercentage = currentQuestion/rows
    percentage = str(round(currentQuestionPercentage*100)) + '%' 
    print(percentage)

    surveyForm = SurveyForm.query.get_or_404(formId)
    
    if request.method == 'POST':
            # If you are not done  
            question = allQuestions[(session['qNumber'])]
            print(question)
            answer = request.form.get('answer')
            dict[int(question.id)] = {
                "question":question.question,
                "answer":answer
            }
            print(dict)
            session['qNumber'] = currentQuestion + 1
            formattedDict = str(dict).replace("},", " } \n")
            print(formattedDict)
            return redirect(url_for('survey', formId = formId))

    elif request.method == 'GET':
        if percentage == '100%':
            # Send the form to admin!
            print(dict)
            print("BE LIKE !))%?")
            formattedDict = str(dict).replace("},", " } \n")
            # sendtelegram(formattedDict)
            session['qNumber'] = 1
            
            newResponse = Responses(response=json.dumps(dict), formName=surveyForm.name, formId = formId)
            db.session.add(newResponse)
            db.session.commit()

            # add result to results array
            # fetch data from question model

            for q in allQuestions:
                # result = result.id.answer.answerId

                # result = q.result[q.id]["answer"][answerId]
                result = json.dumps(q.results)
                # result = q.result[q.id]

                print(result)
                
            # question = SurveyQuestion.query.get_or_404(id)
            # read results column
            

            # print(question.results)
            # fetch question by id
            # fetch answer by number
            # update number
            # db.session.commit()

            # for k, v in dict.items():
            #     print(k, v)




            return redirect(url_for('allSurveys'))

        print(session['qNumber'])

        question = allQuestions[(session['qNumber'])]
        print(question)
 
    return render_template('designForm.html', question=question, currentQuestion=currentQuestion, allQuestions=allQuestions, percentage=percentage, title=surveyForm.name, formId=formId)




@app.route('/courses/<string:lecturer>', methods=['GET', 'POST'])
def courses(lecturer):    
    print("Attempting to find courses for "+ lecturer)
    courses = CourseAllocation.query.filter_by(lecturer=lecturer).all()

    print("courses")
    print(courses)

    departments = []
    sessions = []
    totalStudents = []
    allcourses = []

    for c in courses:
        dep = c.departments
        allcourses.append(c.courseCode + " " +c.courseTitle)
        departments.append(dep)
        sessions.append(c.stream)
        totalStudents.append(c.noOfStudents)
        print(dep)


    print("departments before")
    print(departments)
    departments = list(dict.fromkeys(departments))
    print("departments after")
    print(departments)
    print("sessions before: ")
    print(sessions)
    sessions = list(dict.fromkeys(sessions))
    print("sessions after: " )
    print(sessions)
    totalStudents = list(dict.fromkeys(totalStudents))
    print(departments)
    


    allcourses = list(dict.fromkeys(allcourses))
    responseBody = {}
    responseBody["courses"] = allcourses
    responseBody["departments"] = departments
    responseBody["sessions"] = sessions
    responseBody["totalStudents"] = totalStudents

    print("responseBody")
    print(responseBody)
    # responseBody["allcourses"] = allcourses



        

    # print(courses)

    coursesArray = []

    # Sends an array!!!

    for c in courses:
        print(c)
        courseObj = {}
        courseObj['id'] = c.id
        courseObj['name'] =  c.courseCode + " - " + c.courseTitle 
        courseObj['stream'] =  sessions
        courseObj['department'] =  departments
        courseObj['noOfStudents'] = totalStudents
        coursesArray.append(courseObj)

        print("courseObject to frontend:")
        print("------courseObj--------")
        print(courseObj)

    print("coursesArray")
    print(coursesArray)
    # return jsonify({'courses' : coursesArray})
    return jsonify(responseBody)

@app.route('/lecturers/<string:departmentSlug>', methods=['GET', 'POST'])
def findlecturers(departmentSlug):
    print(departmentSlug)
    lecturers = Lecturer.query.filter_by(departmentSlug = departmentSlug).all()
    department = Department.query.filter_by(slug = departmentSlug).first()
    print(Lecturer.query.count())
    lecturers = dict.fromkeys(lecturers)
    print(len(lecturers))

    return render_template('lecturers.html', lecturers=lecturers, department=department, title="Lecturers")


@app.route('/lecturers', methods=['GET', 'POST'])
def lecturers():
    lecturers = Lecturer.query.all()
    lecturers = dict.fromkeys(lecturers)
    print(len(lecturers))

    return render_template('lecturers.html', lecturers=lecturers, department=None, title="Lecturers")

@app.route('/department/<string:schoolSlug>', methods=['GET', 'POST'])
def department(schoolSlug):
    print("Finding department by slug: " + schoolSlug)
    departments = Department.query.filter_by(schoolSlug=schoolSlug).all()
    print(len(departments))
    return render_template('departments.html', departments=departments, title="Departments")

@app.route('/departments', methods=['GET', 'POST'])
def departments(school=None):
    departments = Department.query.all()
    print(Department.query.count())
    departments = dict.fromkeys(departments)
    print(len(departments))
    return render_template('departments.html', departments=departments, title="Departments")

@app.route('/allocations', methods=['GET', 'POST'])
def allocations(school=None):
    allocations = CourseAllocation.query.order_by(CourseAllocation.id.desc())
    print(allocations.count())
    return render_template('allocations.html', allocations=allocations.all(), title="Course Allocations")


@app.route('/editallocation/<int:courseId>', methods=['GET', 'POST'])
@app.route('/addallocation', methods=['GET', 'POST'])
def addallocation(courseId=None):
    form = CourseAllocationForm()
    title="Add Course Allocation"
    course = None
    form.department.choices = [(g.name, g.name) for g in Department.query.all()]
    try:
        course = CourseAllocation.query.get_or_404(courseId)
    except Exception as e:
        print(e)
        reportError(e)

    if request.method == 'POST':
        pprint.pprint(form.data)
        if form.validate_on_submit():
            message = "This transaction failed"
            try:
                if courseId == None:
                    newCourseAllocation = CourseAllocation(
                        level = form.level.data,
                        courseCode = form.courseCode.data,
                        courseTitle = form.courseTitle.data,
                        creditHours = form.creditHrs.data,
                        stream = form.stream.data,
                        campus = form.campus.data,
                        lecturer = form.lecturer.data,
                        lecturerStatus = form.lecturerStatus.data,
                        lecturerTitle = form.lecturerTitle.data,
                        departments = form.department.data,
                        noOfStudents = form.numberOfStudents.data
                    )
                    db.session.add(newCourseAllocation)
                    message =  newCourseAllocation.courseTitle+" was updated successfully"
                    
                else:
                    course.level = form.level.data,
                    course.courseCode = form.courseCode.data,
                    course.courseTitle = form.courseTitle.data,
                    course.creditHours = form.creditHrs.data,
                    course.stream = form.stream.data,
                    course.campus = form.campus.data,
                    course.lecturerStatus = form.lecturerStatus.data,
                    course.lecturerTitle = form.lecturerTitle.data,
                    course.lecturer = form.lecturer.data,
                    course.departments = form.department.data,
                    course.noOfStudents = form.numberOfStudents.data
                    message = "was updated successfully"
                db.session.commit()

                flash(message, "success")
                return redirect(url_for('allocations'))
            except Exception as e:
                print(e)
                print(e)
        else:
            print(form.errors)
    elif request.method == 'GET':
        if courseId:    
            form.level.data = course.level
            form.courseCode.data = course.courseCode
            form.courseTitle.data = course.courseTitle
            form.creditHrs.data = course.creditHours
            form.stream.data = course.stream
            form.campus.data = course.campus
            form.lecturer.data = course.lecturer
            form.lecturerStatus.data = course.lecturerStatus
            form.lecturerTitle.data = course.lecturerTitle
            form.department.data = course.departments
            form.numberOfStudents.data = course.noOfStudents


    return render_template('editAllocation.html', course=course, form=form, title=title)

@app.route('/deleteCourseAllocation/<int:id>')
def deleteCourseAllocation(id):
    try:
        course = CourseAllocation.query.get_or_404(id)
        db.session.delete(course)
        db.session.commit() 
        flash(course.courseTitle+' has been deleted successfully.', "danger")
    except Exception as e:
        print(e)
        reportError(e)
        flash(course.courseTitle+' could not be deleted.', "warning")
        
    return redirect(url_for('allocations'))

def reportError(e):
    print(e)
    sendtelegram("Your server encounted an error!", str(e))
    return "Reported"

@app.route('/schools', methods=['GET', 'POST'])
def schools():
    schools = School.query.order_by(School.count.desc()).all()
    print(schools)
    print(School.query.count())
    print(len(schools))
    return render_template('schools.html', schools=schools, title="Schools")


@app.route('/alllecturers', methods=['GET', 'POST'])
def alllecturers():
    lecturers = []
    for l in Lecturer.query.all():
        print(l.name)
        lecturers.append(l.name)
    
    print("before")
    print(lecturers)
    lecturers = list(dict.fromkeys(lecturers))
    # list(dict.fromkeys(input_list))
    print("after")
    print(lecturers)

    return {"lecturers":lecturers}

@app.route('/lecturer/<int:id>', methods=['GET', 'POST'])
def lecturer(id):
    lecturerBody = Lecturer.query.get_or_404(id)
    lecturer = LectureAssessment.query.filter_by(lectureName = lecturerBody.name).all()

    allLecturerAssessments = []
    
    print("---- LECTURER -----")
    total = len(lecturer)
    print("------------------")

    if len(lecturer) == 0:
        return "There is no data for " + lecturerBody.name
    
    # get courses
    result = db.session.query(LectureAssessment.course, func.count(LectureAssessment.id)).group_by(LectureAssessment.course).all()
    print(result) 
    print(type(result))

    for course in result:
        print(type(course[0]))
        print(course[0])
        print(course[1])
        lecturer = LectureAssessment.query.filter_by(lectureName = lecturerBody.name, course=course[0]).all()

        if len(lecturer) == 0:
            print("There is no data for " + lecturerBody.name)
        else:

            respondants = len(lecturer)

    # filter by course

            # COURSE CONTENT ----------
            courseOutline = []
            adequateCourseContent = []

            # CLASS ATTENDANCE ----------
            regularLecture = []
            punctualLectures = []

            # MODE OF DELIVERY ----------
            subjectMatterCommand = []
            communicationOfInformation = []
            interactionWithStudents = []
            promoteLearning = []
            promoteIndependentLearning = []
            promoteProblemSolvingLearning = []

            # ASSESSMENT OF MATERIAL TAUGHT ----------
            responseToStudentConcerns = []
            adequaceOfClassAssignments = []
            discussionOfClassAssignments = []


            for c in lecturer:
                # COURSE CONTENT ----------
                courseOutline.append(c.one)
                adequateCourseContent.append(c.two)
                # CLASS ATTENDANCE ----------
                regularLecture.append(c.three)
                punctualLectures.append(c.four)
                # MODE OF DELIVERY ----------
                subjectMatterCommand.append(c.five)
                communicationOfInformation.append(c.six)
                interactionWithStudents.append(c.seven)
                promoteLearning.append(c.eight)
                promoteIndependentLearning.append(c.nine)
                promoteProblemSolvingLearning.append(c.ten)
                # ASSESSMENT OF MATERIAL TAUGHT ----------
                responseToStudentConcerns.append(c.eleven)
                adequaceOfClassAssignments.append(c.twelve)
                discussionOfClassAssignments.append(c.thirteen)

            print(courseOutline)
            # COURSE CONTENT ----------
            courseOutline = processAssessment(courseOutline)
            adequateCourseContent = processAssessment(adequateCourseContent)

            # CLASS ATTENDANCE ----------
            regularLecture = processAssessment(regularLecture)
            punctualLectures = processAssessment(punctualLectures)

            # MODE OF DELIVERY ----------
            subjectMatterCommand = processAssessment(subjectMatterCommand)
            communicationOfInformation = processAssessment(communicationOfInformation)
            interactionWithStudents = processAssessment(interactionWithStudents)
            promoteLearning = processAssessment(promoteLearning)
            promoteIndependentLearning = processAssessment(promoteIndependentLearning)
            promoteProblemSolvingLearning = processAssessment(promoteProblemSolvingLearning)

            # ASSESSMENT OF MATERIAL TAUGHT
            responseToStudentConcerns = processAssessment(responseToStudentConcerns)
            adequaceOfClassAssignments = processAssessment(adequaceOfClassAssignments)
            discussionOfClassAssignments = processAssessment(discussionOfClassAssignments)
        
            # ----------- COURSE CONTENT -----------
            courseContentArray = [courseOutline["percentageScore"], adequateCourseContent["percentageScore"]]
            courseContentMeanValue = findMean(courseContentArray)
            courseContentMeanRating = findMean( [courseOutline["weightedMean"], adequateCourseContent["weightedMean"]])

            # ----------- CLASS ATTENDANCE -----------
            classAttendanceArray = [regularLecture["percentageScore"], punctualLectures["percentageScore"] ]
            classAttendanceMeanValue = findMean(classAttendanceArray)
            classAttendanceMeanRating = findMean([regularLecture["weightedMean"], punctualLectures["weightedMean"]])

            # ----------- MODE OF DELIVERY -----------
            modeOfDeliveryArray = [subjectMatterCommand["percentageScore"], communicationOfInformation["percentageScore"], interactionWithStudents["percentageScore"], promoteLearning["percentageScore"], promoteIndependentLearning["percentageScore"], promoteProblemSolvingLearning["percentageScore"] ]
            modeOfDeliveryMeanValue = findMean(modeOfDeliveryArray)
            modeOfDeliveryMeanRating =findMean([subjectMatterCommand["weightedMean"], communicationOfInformation["weightedMean"], interactionWithStudents["weightedMean"], promoteLearning["weightedMean"], promoteIndependentLearning["weightedMean"], promoteProblemSolvingLearning["weightedMean"]])
        
            # ----------- ASSESSMENT OF MATERIAL TAUGHT -----------
            assessmentOfMaterialTaughtArray = [responseToStudentConcerns["percentageScore"], adequaceOfClassAssignments["percentageScore"], discussionOfClassAssignments["percentageScore"]]
            assessmentOfMaterialTaughtMeanValue = findMean(assessmentOfMaterialTaughtArray)
            assessmentOfMaterialTaughtMeanRating = findMean([responseToStudentConcerns["weightedMean"], adequaceOfClassAssignments["weightedMean"], discussionOfClassAssignments["weightedMean"]])
            
            remarkValue = findRemark(4.79)

            try:
                responseRate = round((respondants/int(c.classSize))*100)
            except Exception as e:
                print(e)
                responseRate = 0

            responseBody = {
                "lecturer":{
                    "lecturerName":c.lectureName,
                    "department":c.department,
                    "course":c.course,
                    "semester":c.semester,
                    "classSize":c.classSize,
                    "respondants":respondants,
                    "responseRate":responseRate
                },
                "courseContent" : {
                    "courseOutline":{
                        "percentageScore":courseOutline["percentageScore"],
                        "weightedMeanScore":courseOutline["weightedMean"]
                    },
                    "adequateContentCourse":{
                        "percentageScore":adequateCourseContent["percentageScore"],
                        "weightedMeanScore":adequateCourseContent["weightedMean"]
                    },
                    "mean":courseContentMeanValue,
                    "meanRating":courseContentMeanRating,
                    "remark":findRemark( courseContentMeanRating)
                },

                "classAttendance" : {
                    "regularLecture":{
                        "percentageScore":regularLecture["percentageScore"],
                        "weightedMeanScore":regularLecture["weightedMean"]
                    },
                    "adequateContentCourse":{
                        "percentageScore":punctualLectures["percentageScore"],
                        "weightedMeanScore":punctualLectures["weightedMean"]
                    },
                    "mean":classAttendanceMeanValue,
                    "meanRating":classAttendanceMeanRating,
                    "remark":findRemark(classAttendanceMeanRating)
                },

                "modeOfDelivery" : {
                    "subjectMatterCommand":{
                        "percentageScore":subjectMatterCommand["percentageScore"],
                        "weightedMeanScore":subjectMatterCommand["weightedMean"]
                    },
                    "communicationOfInformation":{
                        "percentageScore":communicationOfInformation["percentageScore"],
                        "weightedMeanScore":communicationOfInformation["weightedMean"]
                    },
                    "interactionWithStudents":{
                        "percentageScore":interactionWithStudents["percentageScore"],
                        "weightedMeanScore":interactionWithStudents["weightedMean"]
                    },
                    "promoteLearning":{
                        "percentageScore":promoteLearning["percentageScore"],
                        "weightedMeanScore":promoteLearning["weightedMean"]
                    },
                    "promoteIndependentLearning":{
                        "percentageScore":promoteIndependentLearning["percentageScore"],
                        "weightedMeanScore":promoteIndependentLearning["weightedMean"]
                    },
                    "promoteProblemSolvingLearning":{
                        "percentageScore":promoteProblemSolvingLearning["percentageScore"],
                        "weightedMeanScore":promoteProblemSolvingLearning["weightedMean"]
                    },
                    
                    "mean":modeOfDeliveryMeanValue,
                    "meanRating":findMean([subjectMatterCommand["weightedMean"], communicationOfInformation["weightedMean"], interactionWithStudents["weightedMean"], promoteLearning["weightedMean"], promoteIndependentLearning["weightedMean"], promoteProblemSolvingLearning["weightedMean"]]),
                    "remark":findRemark(findMean([subjectMatterCommand["weightedMean"], communicationOfInformation["weightedMean"], interactionWithStudents["weightedMean"], promoteLearning["weightedMean"], promoteIndependentLearning["weightedMean"], promoteProblemSolvingLearning["weightedMean"]]))
                },

                "assessmentOfMaterialTaught" : {
                    "responseToStudentConcerns":{
                        "percentageScore":responseToStudentConcerns["percentageScore"],
                        "weightedMeanScore":responseToStudentConcerns["weightedMean"]
                    },
                    "adequaceOfClassAssignments":{
                        "percentageScore":adequaceOfClassAssignments["percentageScore"],
                        "weightedMeanScore":adequaceOfClassAssignments["weightedMean"]
                    },
                    "discussionOfClassAssignments":{
                        "percentageScore":discussionOfClassAssignments["percentageScore"],
                        "weightedMeanScore":discussionOfClassAssignments["weightedMean"]
                    },
                    "mean":round(assessmentOfMaterialTaughtMeanValue, 2),
                    "meanRating":round(assessmentOfMaterialTaughtMeanRating, 2),
                    "remark":findRemark(assessmentOfMaterialTaughtMeanRating)
                },

                "grandMeanRating":findMean([courseContentMeanRating,classAttendanceMeanRating, modeOfDeliveryMeanRating, assessmentOfMaterialTaughtMeanRating]),
                "grandMeanScore":findMean([assessmentOfMaterialTaughtMeanValue, classAttendanceMeanValue, modeOfDeliveryMeanValue, assessmentOfMaterialTaughtMeanValue]),
                "remark":findRemark(findMean([courseContentMeanRating,classAttendanceMeanRating, modeOfDeliveryMeanRating, assessmentOfMaterialTaughtMeanRating]))

            }
            allLecturerAssessments.append(responseBody)

    # print(lecturer)
    # lecturer =lecturer[-1]

    print("----------FINAL ARRAY------------------")
    pprint.pprint(allLecturerAssessments)
    print("-------AGGREGATION COMPLETE-------------")

    return render_template('lecturer.html', lecturer=lecturer ,lecturerBody=lecturerBody, responseBody=responseBody, allLecturerAssessments=allLecturerAssessments,total = total, title = lecturerBody.name)
    # return responseBody


@app.route('/search', methods=['GET','POST'])
def search():
    # form = Search()
    keyword = request.form.get('searched')
    results = Lecturer.query.filter(or_(Lecturer.name.ilike(f'%{keyword}%'), Lecturer.name.ilike(f'%{keyword}%'))).all()
    print(results)

    return render_template('lecturers.html', lecturers=results, lecturer=lecturer, department=department, title="Lecturers")

    # return jsonify([result.serialize() for result in results])

def percent(value, total):
    if total != 0 and value != 0:
        percentage = round((value/total) * 100, 2)
    else:
        percentage = 0
    return percentage

def findMean(array):
    print("array")
    print(array)
    sum = 0
    arrayLength = len(array)
    for n in array:
        # print(n)
        n = int(n)
        # print((type(n)))
        sum += n

        # Cant divide by zero
    mean = sum / arrayLength

    print("Mean :" + str(mean))
    return mean

def findRemark(value):
    print("INSIDE REMARK FUNCTION")

    remark = "NULL"
    value = float(value)

    print("value: " + str(value))

    if value <= 5 and value >= 4.5:
        remark = "Excellent"
    elif value <= 4.49 and value >= 4.0:
        remark = "Very Good"
    elif value <= 3.9 and value >= 3.0:
        remark = "Good"
    elif value <= 2.9 and value >= 2.0:
        remark = "Satisfactory"
    elif value <= 1.99 and value >= 1.0:
        remark = "Poor"
    else:
        print(value)
        remark = "ei!"
    return remark

def processAssessment(assessments):  
    numberOfAssessments = len(assessments)
    total = numberOfAssessments * 5
    assessmentScore = 0
    comprehensiveOutline = 0
    adequateCourseContent = 0
    meanScore = 0
    sumOfCourses = 0
    meanTotal = 0
    meanArray = []
    responseBody = {}
    assessmentBody = {}

    print(assessments)
    print("Total - " + str(total))

    for courseContent in assessments: 
        sumOfCourses += int(courseContent)
        meanArray.append(int(courseContent))

    responseBody["comprehensiveOutline"] = comprehensiveOutline
    responseBody["adequateCourseContent"] = comprehensiveOutline

    # PERCENTAGE SCORE
    comprehensiveOutline = percent(comprehensiveOutline, total)
    adequateCourseContent = percent(adequateCourseContent, total)

    responseBody["comprehensiveOutlinePercentage"] = comprehensiveOutline
    responseBody["adequateCourseContentPercentage"] = adequateCourseContent

    # PERCENTAGE
    assessmentBody["percentageScore"] = percent(sumOfCourses, total)

    # MEAN SCORE
    meanScore = findMean(meanArray)
    assessmentBody["meanScore"] = meanScore

    # REMARK
    assessmentBody["remark"] = findRemark(2.6)

    # WEIGHTED MEAN
    assessmentBody["weightedMean"] = round(findMean(assessments), 2)

    # MEAN RATING
    assessmentBody["meanRating"] = ""

    # GRAND MEAN SCORE
    assessmentBody["grandMeanScore"] = ""

    # ASSESSMENT
    print("assessmentScore - " + str(assessmentScore))
    print("total - " + str(total))

    return assessmentBody

# def courseContentScore(assessments):  
#     numberOfAssessments = len(assessments)
#     total = numberOfAssessments * 5
#     assessmentScore = 0
#     comprehensiveOutline = 0
#     adequateCourseContent = 0
#     meanScore = 0
#     meanTotal = 0
#     meanArray = []
#     responseBody = {}

#     print(assessments)
#     print("Total - " + str(total))

#     for courseContent in assessments: 
#         print("Comprehensive Outline - " + courseContent.one)
#         comprehensiveOutline += int(courseContent.one)
#         meanArray.append(int(courseContent.one))
#         print("Course content was adequately covered - " + courseContent.two)
#         adequateCourseContent += int(courseContent.two)
#         meanArray.append(int(courseContent.two))

#     responseBody["comprehensiveOutline"] = comprehensiveOutline
#     responseBody["adequateCourseContent"] = comprehensiveOutline

#     # PERCENTAGE SCORE
#     comprehensiveOutline = percent(comprehensiveOutline, total)
#     adequateCourseContent = percent(adequateCourseContent, total)

#     responseBody["comprehensiveOutlinePercentage"] = comprehensiveOutline
#     responseBody["adequateCourseContentPercentage"] = adequateCourseContent

#     # MEAN SCORE
#     meanScore = findMean(meanArray)
#     responseBody["meanScore"] = meanScore

#     # REMARK
#     responseBody["remark"] = findRemark(2.6)

#     print("assessmentScore - " + str(assessmentScore))
#     print("total - " + str(total))
#     # print(percentage)

#     return responseBody


@app.route('/stream/<string:s>', methods=['GET', 'POST'])
def stream(s):    
    streams = CourseAllocation.query.filter_by(stream=s).all()
    print(s)

    streamsArray = []

    for s in streams:
        print(s)
        courseObj = {}
        courseObj['id'] = s.id
        courseObj['courseName'] =  s.courseTitle
        courseObj['name'] =  s.stream
        streamsArray.append(courseObj)

    return jsonify({'streams' : streamsArray})

@app.route('/satc', methods=['GET', 'POST'])
def satc():
    form = LectureAssessmentForm()
    if request.method == 'POST':
        if form.validate_on_submit:
            content = {
            }
            attendance = {
            }
            modeOfDelivery = {
            }
            assessment = {
            }
            generalAssessment = {
            }
            courseAssessment = {
            }

            findByName = Lecturer.query.filter_by(name = form.name.data).first().id

            newlectureassessmentform = LectureAssessment(
                lectureId = findByName,
                lectureName = form.name.data,
                department = form.department.data,
                course = form.course.data,
                semester = form.semester.data,
                classSize = form.classSize.data,
                one = form.one.data,
                two = form.two.data,
                three = form.three.data,
                four = form.four.data,
                five = form.five.data,
                six = form.six.data,
                seven = form.seven.data,
                eight = form.eight.data,
                nine = form.nine.data,
                ten = form.ten.data,
                eleven = form.eleven.data,
                twelve = form.twelve.data,
                thirteen = form.thirteen.data,
                fourteen = form.fourteen.data,
                fifteen = form.fifteen.data,
                sixteen = form.sixteen.data,
                seventeen = form.seventeen.data,
                eighteen = form.eighteen.data,
                nineteen = form.nineteen.data
            )
            
            db.session.add(newlectureassessmentform)
            db.session.commit()

            # sendEmail("New SATC Entry for " + form.name.data + " \n Open https://forms.central.edu.gh/dashboard for an insight into your data", {"name":"prestoghana@gmail.com"} )
            return redirect(url_for('allSurveys'))
        

    return render_template('simpleform.html', form=form, title="Students Assessment of Teaching and Courses (SATC)", description="Participate in the Central University Lecturer and Staff Assessment Survey to influence the quality of our academic community with your valuable insights.")


@app.route('/satcresponse/<string:id>', methods=['GET', 'POST'])
def satcResponse(id):
    print(id)
    form = LectureAssessmentForm()

    response = LectureAssessment.query.get_or_404(id)

    form.name.data = response.lectureName
    form.department.data = response.department
    form.course.data = response.course
    form.semester.data = response.semester
    form.classSize.data = response.classSize
    form.one.data = response.one
    form.two.data = response.two
    form.three.data = response.three
    form.four.data = response.four
    form.five.data = response.five
    form.six.data = response.six
    form.seven.data = response.seven
    form.eight.data = response.eight
    form.nine.data = response.nine
    form.ten.data = response.three
    form.eleven.data = response.eleven
    form.twelve.data = response.twelve
    form.thirteen.data = response.thirteen
    form.fourteen.data = response.fourteen
    form.fifteen.data = response.fifteen
    form.sixteen.data = response.sixteen
    form.seventeen.data = response.seventeen
    form.eighteen.data = response.eighteen
    form.nineteen.data = response.nineteen
    return render_template('simpleform.html', form=form)

@app.route('/design', methods=['GET', 'POST'])
def design():
     return render_template('designForm copy.html',  question="question", currentQuestion="currentQuestion", allQuestions="allQuestions", percentage="percentage", title="surveyForm", formId=1)

@app.route('/results', methods=['GET', 'POST'])
def results():
    return render_template('results.html')

@app.route('/tracerform', methods=['POST','GET'])
def tracerform():
    form=TracerForm()

    tracerDescription = "Dear Graduate, Through this questionnaire CU aims to track its graduates and receive feedback regarding the type of work, further study or other activity you are/have been involved in since you completed your study from Central University. The information provided will assist the institution to plan both for future educational needs and improve its programmes. Results of this tracer study will only be presented in summary form and individual responses will be kept strictly confidential. We would, therefore, highly appreciate if you could complete the following questionnaire and return it to us, at your earliest convenience. Thank you for your kind cooperation and support."

    if request.method == 'POST':
        pprint.pprint(form.data)
        # if form.validate_on_submit():
        response = {}
        message = "<h1>New Entry From: " + form.mobile.data  + "</h1>"
        
        for item in form.data:
            field = getattr(form, item)
            print(field.label.text)
            print(item + " - " + str(form.data.get(item)))

            response[field.label.text] = form.data.get(item)

            message += '<div style="display:flex"><h4>'+str(field.label.text)+': </h4><h4>'+str(form.data.get(item))+'</h4></div>'

        print(response)

        senderDict = {"name":"Nana Kweku"}

        try:
            sendAnEmail("Presto Mail", "New Tracer Entry From: " + form.mobile.data, message, superAdminMail)
        except Exception as e:
            reportError(e)

            formResponse = TracerFormResponse(value = json.dumps(response))

            db.session.add(formResponse)
            db.session.commit()

        flash(f'Your form has been submitted successfully!')
        print("Sumbitted.")

        return redirect(url_for('success'))
        # else:
        #     print(form.errors)
        #     reportError(form.errors)
        #     print(form.errors.keys[0])
        #     if len(form.errors) == 1 and form.errors.keys[0] == "csrf_token":
        #         # sendtelegram("Done")
        #         print("Done")

    elif request.method == 'GET':
        print(form._csrf)
    return render_template('tracer.html', form=form, title="Alumni Tracer Form ", description=tracerDescription)


@app.route('/fooroute', methods=['GET', 'POST'])
def fooroute():
    senderDict = {"name":"Nana Kweku"}
    return sendEmail("hello",senderDict)


def sendResponseMail(message, sender,recipeints=None):
    print(message)
    response = "Mail Sent To "+ sender["name"] + " was succesful"
    try:
        # message = "From: " + form.name.data + "\n Phone: " + form.number.data + "\n Message: " + form.message.data
        prestoUrl = 'https://sandbox.prestoghana.com'
        recipeints = []

        print(message)

        if recipeints == None:
            recipeints = adminMail

        try:
            requests.get(prestoUrl+'/sendPrestoMail?recipient='+'prestoghana@gmail.com'+'&subject='+sender["name"]+'&message='+message)
            print("Email has been delivered successfully.")
        except Exception as e:
            print(e)

        flash('Hi, ' + sender["name"] + ' your message has been submitted successfully.','success')
    except Exception as e:
        print(e)
        response = "Mail Sent To "+ sender["name"] + " was succesful \n" + str(e)
        print("Unable to send emails!")
        flash('Oops, there was an error sending your email, please check and try again.','fail')
        sendtelegram('Oops, there was an error sending your email, please check and try again.')

    return response
    

def sendEmail(message, sender,recipeints=None):
    print(message)
    print(sender)
    response = "Mail Sent To "+ sender["name"] + " was succesful"
    try:
        # message = "From: " + form.name.data + "\n Phone: " + form.number.data + "\n Message: " + form.message.data
        prestoUrl = 'https://prestoghana.com'
        recipeints = []

        if recipeints == None:
            recipeints = adminMail

        try:
            requests.get(prestoUrl+'/sendPrestoMail?recipient=compliance.qualityassurance@central.edu.gh&subject='+sender["name"]+'&message='+message)
        except Exception as e:
            print(e)

        flash('Hi, ' + sender["name"] + ' your message has been submitted successfully.','success')
    except Exception as e:
        print(e)
        response = "Mail Sent To "+ sender["name"] + " was succesful \n" + str(e)
        print("Unable to send emails!")
        flash('Oops, there was an error sending your email, please check and try again.','fail')
        sendtelegram('Oops, there was an error sending your email, please check and try again.')

    return response


# @app.route('/sendAnEmail', methods=['GET','POST'])
def sendAnEmail(title,subject,message, email_receiver, path=None):
    print("Attempting to send an email")
    print(email_receiver)
    print(type(email_receiver))

    email_sender = 'pay@prestoghana.com'
    email_password = 'Babebabe123$'

    sendtelegram("\nSending an email to ".join(email_receiver))

    # recievers = ['prestoghana@gmail.com', 'onikosiadewale18@gmail.com', 'cuscu@central.edu.gh', 'jamiteye@central.edu.gh', 'benejune@gmail.com', 'graceturtcson04@gmail.com']

    # for r in email_receiver:
    #     recievers.append(r)
    # print("recievers")
    # print(recievers)

    
    # email_receiver = recipient

    html_content = f"""
    <!DOCTYPE html>
    <html>
    <head>
        <style>
        @font-face {{
            font-family: 'Plus Jakarta';
            src: url('PlusJakartaSans-VariableFont_wght.woff2') format('woff2-variations'),
                url('PlusJakartaSans-Italic-VariableFont_wght.woff2') format('woff2-variations');
            font-weight: 100 500; /* Adjust font weights based on available weights */
            font-style: normal;
        }}

        body {{
            font-family: 'Plus Jakarta', sans-serif;
            color:black;
            margin: auto 10px;
        }}

        div{{
            font-family: 'Plus Jakarta', sans-serif;
            font-weight:200;
        }}

        </style>

    </head>
    <body style="margin:auto 10px; color:black; font-family: 'Plus Jakarta', sans-serif;">
        {message}
        <h6 style="font-weight:200">This email is powered by <a href='https://prestoghana.com'>PrestoGhana</a></h6>
    </body>
    </html>
    """

    em = EmailMessage()
    em["From"] = f"{title} <{email_sender}>"
    em['To'] = email_receiver
    em['Subject'] = subject

    em.set_content('')  
    em.add_alternative(html_content, subtype='html')

    print(em)

    if path != None:
        em.add_attachment(open(path, 'rb').read(), maintype='application', subtype='pdf', filename=title)

    smtp_server = 'mail.privateemail.com'
    port = 465


    server = smtplib.SMTP_SSL(smtp_server, port)
    server.login(email_sender, email_password)
    server.sendmail(email_sender, email_receiver, em.as_string())
    server.quit()
    return "Done!"
    

if __name__ == '__main__':    
    app.run(host='0.0.0.0', port=4000,debug=True)
