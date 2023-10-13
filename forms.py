from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, BooleanField, SelectField, IntegerField, RadioField, TextAreaField
from wtforms.validators import DataRequired, Email, Length, EqualTo, ValidationError

class RegistrationForms(FlaskForm):
    residence = StringField('Residence', validators=[DataRequired()])
    region = StringField('Region of permanent residence', validators=[DataRequired()])
    gender = StringField('Gender', validators=[DataRequired()])
    age = StringField('Age', validators=[DataRequired()])
    nationality = StringField('Nationality')
    market = SelectField('How did you hear about central university before coming here.', choices=[('Media/Newspaper', 'Media/Newspaper'),('Friend or Relative', 'Friend or Relative'),('The Internet', 'The Internet'),('Outreach Programme', 'Outreach Programme')])
    recommendation = BooleanField('Would you recommend Central University to a potential applicant')
    submit = SubmitField('Okay')

class CourseAllocationForm(FlaskForm):
    level = SelectField('Level', choices=[('100', '100'),('200', '200'),('300', '300'),('400', '400'),('500', '500')])
    courseCode = StringField('Course Code', validators=[DataRequired()])
    courseTitle = StringField('Course Title', validators=[DataRequired()])
    lecturer = StringField('Lecturer', validators=[DataRequired()])
    creditHrs = StringField('Credit Hours', validators=[DataRequired()])
    stream = SelectField('Stream', choices=[('Morning','Morning') ,('Evening','Evening') ,('Weekend','Weekend')])
    campus = SelectField('Campus', choices=[('Miotso','Miotso'), ('Christ Temple','Christ Temple'), ('Kumasi','Kumasi'), ])
    lecturerStatus = SelectField('Lecturer Status', choices=[('Full Time','Full Time'),('Adjunct','Adjunct'),('Full Time','Full Time'),('Part Time','Part Time')])
    lecturerTitle = SelectField('Lecturer Title', choices=[('Dr','Dr'),('Mr','Mr'),('Mrs','Mrs'),('Prof','Prof'),('Director','Director')])
    department = SelectField('Department')
    numberOfStudents = IntegerField('Number Of Students', validators=[DataRequired()])
    submit = SubmitField('Upload')
    

class Questions(FlaskForm):
    question = StringField('Phone', validators=[DataRequired()])
    q_number = StringField('Question Number')
    component= SelectField('Component', choices=[('--Component--', '--Component--'),('Prior Knowledge', 'Prior Knowledge'), ('Social Engagement', 'Social Engagement'), ('Relevance', 'Relevance'), ('Application', 'Application'),('Lecture Focus', 'Lecture Focus'),('Meaningful Application', 'Meaningful Application'),('Organisation', 'Organisation'),('Visualization', 'Visualization'),('Elaboration', 'Elaboration'),('Repetition', 'Repetition'),('Empowerment', 'Empowerment'),('Usefulness', 'Usefulness'),('Success', 'Success'),('Interest', 'Interest'),('Caring', 'Caring')])
    skillGroup = SelectField('Skill Group', choices=[('--Skill Group--', '--Skill Group--'),('Learner Centricity', 'Learner Centricity'),('Teaching for Recall', 'Teaching for Recall'),('Teaching for Engagement', 'Teaching for Engagement')])
    submit = SubmitField('Submit')

class NewForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired()])
    description = StringField('Name', validators=[DataRequired()])
    consumer = StringField('consumer')
    submit = SubmitField('Submit')

class NewQuestion(FlaskForm):
    question = StringField('Question', validators=[DataRequired()])
    questionUpdate = StringField('QuestionUpdate')
    submit = SubmitField('Submit')

class Search(FlaskForm):
    query = StringField('Search Query')

class LectureAssessmentForm(FlaskForm):
    name = StringField('Name Of Lecturer', validators=[DataRequired()])
    part = SelectField('Part Time or Full Time' , choices=[('Part Time', 'Part Time'), ('Full Time', 'Full Time')])
    department = SelectField('Department',  choices=[('N/A', 'N/A')],validators=[DataRequired()])
    course = SelectField('Course Code & Title', choices=[('N/A', 'N/A')])
    semester = SelectField('Semester/Trimester & Year', choices=[("First Semester", "First Semester"), ("Second Semester","Second Semester")])

    classSize = SelectField('ClassSize', choices=[('N/A', 'N/A')])
    session = SelectField('Session', choices=[('Morning', 'Morning'), ('Afternoon', 'Afternoon'), ('Evening', 'Evening'), ('Weekend', 'Weekend')])
    
    one = SelectField('Provision of helpful course outlines', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    two = SelectField('Coverage of course content by lecturer', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])

    three = SelectField('Regular holding of classes', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    four = SelectField('Punctuality', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    
    five = SelectField('Command of the subject matter', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    six = SelectField('Communication of the information', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    seven = SelectField('Interaction with students in class', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    eight = SelectField('Use of class tiem to promote learning', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    nine = SelectField('Promotion of independent stude', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    ten = SelectField('Promotion of problem solving learning', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    
    eleven = SelectField('Response to students concern', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    twelve = SelectField('Adequace of class assignments', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    thirteen = SelectField('Marking and discussion of class assignments', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])
    fourteen = SelectField('What was your general impression of the lecturer', choices=[('5', 'Excellent'), ('4', 'Very Good'), ('3', 'Good'), ('2', 'Satisfactory') , ('1', 'Poor')])

    # SECTION C
    
    fifteen = StringField('What aspect of the course did you find most helpful', validators=[DataRequired()])
    sixteen = StringField('What aspect of the course did you find difficult helpful', validators=[DataRequired()]) 
    seventeen = StringField('What aspect of the course did you dislike most', validators=[DataRequired()]) 
    eighteen = StringField('What suggestions do you have for improving the course', validators=[DataRequired()]) 
    # Text Widget
    nineteen = StringField('What suggestions do you have for improving the course', validators=[DataRequired()]) 
    submit = SubmitField('Submit')

class TracerForm(FlaskForm):
    # PERSONAL INFORMATION

    gender = SelectField('Gender', choices=[('', 'Select an option...') ,('Male', 'Male') ,('Female', 'Female')], validators=[DataRequired()], render_kw={"required": "required"})
    workadd = StringField('Work Address', validators=[DataRequired()])
    mobile = StringField('Mobile Number', validators=[DataRequired()])
    residence = StringField('Country of Residence', validators=[DataRequired()])
    programme = StringField('Programme Pursued', validators=[DataRequired()])
    completion = IntegerField('Year of Completion', validators=[DataRequired()])
    others = SelectField('Since your graduation have you gone on to take any other programme?', choices=[('', 'Select an option...') ,('Yes', 'Yes') , ('No', 'No')], validators=[DataRequired()])
    status = SelectField('(If Yes, What is your current status, If No skip)', choices=[('', 'Select an option...') ,('Enrolled part time', 'Enrolled part time') ,('Enrolled full time', 'Enrolled full time'), ('Completed', 'Completed')])
    pro = StringField('List programme')
    institution = StringField('Name of Institution')
    completed = StringField('Year of Completion')
    satisfaction = SelectField('Overall how satisfied were you with the academic preparation for your current programme', choices=[('', 'Select an option...') ,('Very satisfied', 'Very satisfied') ,('Satisfied', 'Satisfied'), ('Unsatisfied', 'Unsatisfied'), ('Very unsatisfied', 'Very unsatisfied')])

    # EMPLOYMENT INFORMATION

    current = SelectField('Which one of the following best describes your current employment status?', choices=[('', 'Select an option...') ,('Working full-time', 'Working full-time') ,('Working part-time but seeking full-time work', 'Working part-time but seeking full-time work') , ('Working part-time but not seeking full-time work', 'Working part-time but not seeking full-time work') , ('Self - employed', 'Self - employed') , ('Not working and looking for a job', 'Not working and looking for a job') , ('Not working and not looking for a job', 'Not working and not looking for a job')])
    job = SelectField('How long did it take you to find your job?', choices=[('', 'Select an option...') ,('I found employment prior to graduation', 'I found employment prior to graduation') ,('I found employment after graduation', 'I found employment after graduation') , ('I found employment during my national service ', 'I found employment during my national service ') , (' I found employment after national service', ' I found employment after national service')])
    service = SelectField('How related is your current job to your program of study?', choices=[('', 'Select an option...') ,(' Fully related', ' Fully related') ,(' Partial related', ' Partial related') , ('Not related ', 'Not related ')])
    orgname = StringField('Organization')
    orgadd = StringField('Organization Address')
    title = StringField('Job title')
    orgtype = SelectField('Type of Organization', choices=[('', 'Select an option...') ,('Private', 'Private') ,('Government', 'Government') , ('NGO/INGO', 'NGO/INGO') , ('Self Employed', 'Self Employed')])
    salary = SelectField('What is your current monthly gross salary?', choices=[('', 'Select an option...') ,('Below GHC1000', 'Below GHC1000') ,('Between GHC1000-GHC2000', 'Between GHC1000-GHC2000') , ('Between GHC2100-GHC3000', 'Between GHC2100-GHC3000') , ('Between GHC3001-GHC4000', 'Between GHC3001-GHC4000') , ('Above GHC4000', 'Above GHC4000') , (' Prefer not to answer', ' Prefer not to answer')])
    employment = SelectField('In your current job, are you', choices=[('', 'Select an option...') ,('A permanent employee', 'A permanent employee') ,(' A contract employee', ' A contract employee') , ('A seasonal/temporary employee', 'A seasonal/temporary employee') , ('Self-employed', 'Self-employed')])
    skills = SelectField('To what extent did the skills you developed during your studies help you get your job? Would you say that your skills were', choices=[('', 'Select an option...') ,('Very helpful', 'Very helpful') ,('Helpful', 'Helpful'), ('Somewhat helpful', 'Somewhat helpful'), ('Not helpful', 'Not helpful')])
    timeframe = SelectField('How long have you been employed or self-employed?', choices=[('', 'Select an option...') ,(' Less than 6 months', ' Less than 6 months') ,(' 6 months to 1 year', ' 6 months to 1 year'), (' 1 year to 18 months', ' 1 year to 18 months'), ('Greater than 18 months', 'Greater than 18 months')])
    earn = SelectField('Did your degree earned from CU provide the requisite technical know-how of your job?', choices=[('', 'Select an option...') ,('Select', 'Select') , ('Yes', 'Yes') , ('No', 'No')])
    

    #SKILLS AND ABILITY

    theoretical = SelectField('Specific job-related theoretical knowledge', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    technical = SelectField('Specific job-related skills(e.g. technical skills)', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    communication = SelectField('Communication (oral and written) – speak/write in a clear,concise,correctmanner', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    comprehension = SelectField('Comprehension - can restate information, ideas and concepts in different ways', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    quantitative = SelectField('Quantitative skills (Ability to use mathematical concepts)', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    computer = SelectField('Computer skills', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    critical = SelectField('Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    research = SelectField('Research and analysis - collects, analyzes and organizes relevant information', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    team = SelectField('Team-work', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    planning = SelectField('Organization and planning - determines tasks and resources to complete project objectives', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    management = SelectField('Time management - sets priorities and allocates time efficiently to complete tasks within deadlines', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    quality = SelectField('Quality of work - performs tasks accurately and pays attention to detail', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    creative = SelectField('Creative and innovative - creates innovative strategies and / or products that meet identified needs', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    adaptable = SelectField('Adaptable - adapts to new situations and demands by applying or updating knowledge and skills', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    responsible = SelectField('Responsible - takes responsibility for his/her own actions and decisions', choices=[('', 'Select an option...') ,('Extremely Important', 'Extremely Important') ,('Important', 'Important'), ('UnImportant', 'UnImportant'), ('Not Applicable', 'Not Applicable')])
    
    theoreticals = SelectField('Specific job-related theoretical knowledge', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    technicals = SelectField('Specific job-related skills(e.g. technical skills)', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    communications = SelectField('Communication (oral and written) – speak/write in a clear,concise,correctmanner', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    comprehensions = SelectField('Comprehension - can restate information, ideas and concepts in different ways', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    quantitatives = SelectField('Quantitative skills (Ability to use mathematical concepts)', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    computers = SelectField('Computer skills', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    criticals = SelectField('Critical thinking and problem solving- evaluates his/ her own thinking for problem solving and decision making', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    researchs = SelectField('Research and analysis - collects, analyzes and organizes relevant information', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    teams = SelectField('Team-work', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('UnImportant', 'UnImportant'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    plannings = SelectField('Organization and planning - determines tasks and resources to complete project objectives', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    managements = SelectField('Time management - sets priorities and allocates time efficiently to complete tasks within deadlines', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    qualitys = SelectField('Quality of work - performs tasks accurately and pays attention to detail', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    creatives = SelectField('Creative and innovative - creates innovative strategies and / or products that meet identified needs', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    adaptables = SelectField('Adaptable - adapts to new situations and demands by applying or updating knowledge and skills', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
    responsibles = SelectField('Responsible - takes responsibility for his/her own actions and decisions', choices=[('', 'Select an option...') ,('Well Prepared', 'Well Prepared') ,('Prepared', 'Prepared'), ('Somewhat Unprepared', 'Somewhat Unprepared'), ('Unprepared', 'Unprepared'), ('Completely Unprepared', 'Completely Unprepared')])
   
    staying = SelectField('How likely are you to staying in your current job or profession?', choices=[('', 'Select an option...') ,('Very likely', 'Very likely') ,('Likely', 'Likely'), ('Unlikely', 'Unlikely'), ('Very unlikely', 'Very unlikely')])
    schoolreturn = SelectField('How likely are you to return to the same school?', choices=[('', 'Select an option...') ,('Very likely', 'Very likely') ,('Likely', 'Likely'), ('Unlikely', 'Unlikely'), ('Very unlikely', 'Very unlikely')])
    unemployed = SelectField('What is the main reason you are unemployed?', choices=[('', 'Select an option...') ,(' There are no jobs available in my filed', ' There are no jobs available in my filed') ,('I do not have the required skills in my field', 'I do not have the required skills in my field'), ('I do not know where to look for jobs in my field', 'I do not know where to look for jobs in my field'), ('Personal reasons', 'Personal reasons') , ('Others', 'Others')])
    work = SelectField('Have you ever been employed since graduation?', choices=[('', 'Select an option...') ,('Yes', 'Yes') , ('No', 'No')])
    workframe = SelectField('How long did you work?', choices=[('', 'Select an option...') ,('1-3 months', '1-3 months') ,('4-6 months', '4-6 months'), ('More than 6 months', 'More than 6 months')])
    #SUGGESTIONS

    overall = SelectField('How would you rate your overall satisfaction with your university’s preparation for the type of work you were/are doing?', choices=[('', 'Select an option...') ,('Very satisfied', 'Very satisfied') ,('Satisfied', 'Satisfied'), ('Unsatisfied', 'Unsatisfied'), ('Very unsatisfied', 'Very unsatisfied')])
    recommend = SelectField('Would you recommend your program to someone else or not? [If respondent is enrolled in a second tertiary program, response required for their previous program] ', choices=[('', 'Select an option...') ,('Yes', 'Yes') , ('No', 'No')])
    suggestion = StringField('Do you have any suggestions for overall service delivery at Central University?')

    submit = SubmitField('Submit')


class ContactForm(FlaskForm):
    name = StringField('Name', validators=[DataRequired()])
    number = StringField('Phone Number', validators=[DataRequired()])
    message = TextAreaField('Message', validators=[DataRequired()])

    submit = SubmitField('Submit')


class StaffBio(FlaskForm):
    name = SelectField('Full Name', validators=[DataRequired()])
    staffid = StringField('Staff ID', validators=[DataRequired()])
    phone = StringField('Phone Number', validators=[DataRequired()])
    email = StringField('Email Address', validators=[DataRequired()])
    submit = SubmitField('Submit')