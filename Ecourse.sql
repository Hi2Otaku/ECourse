Create Database ECourse
Go

Use ECourse

Create Table [User](
	UserID int not null,
	UserName nvarchar(100) not null unique,
	salt nvarchar(100) not null,
	[Password] nvarchar(100) not null, 
	Gender int not null,
	Mail nvarchar(100) not null unique,
	FullName nvarchar(100) not null,
	DoB Date not null,	
	SecurityQuestionID int not null,
	Answer nvarchar(100) not null,
	[Role] int not null,
	[Status] int not null,
	Primary Key(UserID)	
);

Create Table [SEQuestion](
	SecurityQuestionID int not null,
	Question nvarchar(100) not null,
	Primary Key (SecurityQuestionID)
);

Create Table [Course](
	CourseID int not null,
	CourseName nvarchar(100) not null,
	Price float not null,
	[Description] nvarchar(500),
	CreateDate date not null,
	UserID int not null
	Primary Key(CourseID)
);

Create Table [Lesson](
	CourseID int not null,
	LessonID int not null,
	LessonName nvarchar(100) not null,	
	[Description] nvarchar(500),	
	Primary Key(CourseID, LessonID)
);

Create Table [LessonDoc](
	CourseID int not null,
	LessonID int not null,
	DocID int not null,
	[Title] nvarchar(500) not null,
	[Description] nvarchar(500),
	[Link] nvarchar(100) not null
	Primary Key (CourseID, LessonID, DocID)
);

Create Table [Quiz](
	CourseID int not null,
	LessonID int not null,
	QuizID int not null,
	QuizName nvarchar(100) not null,
	NoQ int not null,
	TimeLimit int not null,
	CreateDate date not null,	
	Primary Key (CourseID, LessonID, QuizID)
);

Create Table [Question](
	CourseID int not null, 
	LessonID int not null,
	QuizID int not null,
	QuestionID int not null,
	Question nvarchar(100) not null,
	Explaination nvarchar(100),
	[Status] int not null,
	Primary Key (CourseID, LessonID, QuizID, QuestionID)
);

Create Table [Answer](
	CourseID int not null,
	LessonID int not null,
	QuizID int not null,
	QuestionID int not null,
	AnswerID int not null,
	[Description] nvarchar(100) not null,
	[Role] int not null,
	Primary Key (CourseID, LessonID, QuizID, QuestionID, AnswerID)
);

Create Table [UserAnswer](
	UserID int not null,
	AttemptID int not null,
	CourseID int not null,
	LessonID int not null,
	QuizID int not null,
	QuestionID int not null,	
	AnswerID int not null,
	Primary Key (UserID, AttemptID, CourseID, LessonID, QuizID, QuestionID, AnswerID)
);

Create Table [Attempt](
	UserID int not null,
	CourseID int not null,
	LessonID int not null,
	QuizID int not null,
	AttemptID int not null,
	AttemptDate datetime not null,
	SubmittedDate datetime,
	[Finished] int not null,
	Primary Key (UserID, CourseID, LessonID, QuizID, AttemptID)
);

Create Table [Discount](
	CourseID int not null,
	[Percentage] float not null,
	Primary Key (CourseID)
);

Create Table [Feedback](
	UserID int not null,
	CourseID int not null,
	FeedbackID int not null,	
	CreateDate date not null,
	[Description] nvarchar(500) not null,
	Primary Key (UserID, CourseID, FeedbackID)
);

Create Table [Cart](
	UserID int not null,
	CourseID int not null,	
	Primary Key (UserID, CourseID)
);

Create Table [Order](
	OrderID int not null,
	UserID int not null,
	CreateDate date not null,
	Price float not null,
	Primary Key (OrderID, UserID)
);

Create Table [OwnCourse](
	CourseID int not null,
	UserID int not null,
	OrderID int not null,
	Primary Key (CourseID, UserID, OrderID)
);

Create Table [Category](
	CategoryID int not null,
	CategoryName nvarchar(100) not null,
	[Status] int not null
	Primary Key (CategoryID)
);

Create Table [CourseCategory](
	CourseID int not null,
	CategoryID int not null,
	Primary Key (CourseID, CategoryID)	
);

Create Table [Subject](
	SubjectID int not null,
	SubjectName nvarchar(100) not null,
	[Status] int not null
	Primary Key (SubjectID)
);

Create Table [CourseSubject](
	CourseID int not null,
	SubjectID int not null,
	Primary Key (CourseID, SubjectID)
);

Create Table [DocProgress] (
	UserID int not null,
	CourseID int not null, 
	LessonID int not null,
	DocID int not null,
	[Status] int not null,
	Primary Key (UserID, CourseID, LessonID, DocID)
);

Create Table [QuizProgress] (
	UserID int not null,
	CourseID int not null, 
	LessonID int not null,
	QuizID int not null,
	[Status] int not null,
	Primary Key (UserID, CourseID, LessonID, QuizID)
);

Alter Table [Attempt] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [OwnCourse] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [Order] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [User] with nocheck
	Add Foreign Key (SecurityQuestionID) References [SEQuestion](SecurityQuestionID)
Alter Table [Cart] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [Discount] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [Feedback] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [Cart] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [OwnCourse] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [Lesson] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [Quiz] with nocheck
	Add Foreign Key (CourseID, LessonID) References [Lesson](CourseID, LessonID)
Alter Table [Question] with nocheck
	Add Foreign Key (CourseID, LessonID, QuizID) References [Quiz](CourseID, LessonID, QuizID)
Alter Table [Answer] with nocheck
	Add Foreign Key (CourseID, LessonID, QuizID, QuestionID) References [Question](CourseID, LessonID, QuizID, QuestionID)
Alter Table [Attempt] with nocheck
	Add Foreign Key (CourseID, LessonID, QuizID) References [Quiz](CourseID, LessonID, QuizID)
Alter Table [UserAnswer] with nocheck 
	Add Foreign Key (UserID, CourseID, LessonID, QuizID, AttemptID) References [Attempt](UserID, CourseID, LessonID, QuizID, AttemptID)
Alter Table [UserAnswer] with nocheck
	Add Foreign Key (CourseID, LessonID, QuizID, QuestionID) References [Question](CourseID, LessonID, QuizID, QuestionID)
Alter Table [OwnCourse] with nocheck
	Add Foreign Key (OrderID, UserID) References [Order](OrderID, UserID)
Alter Table [LessonDoc] with nocheck
	Add Foreign Key (CourseID, LessonID) References [Lesson](CourseID, LessonID)
Alter Table [CourseCategory] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [CourseSubject] with nocheck
	Add Foreign Key (CourseID) References [Course](CourseID)
Alter Table [CourseCategory] with nocheck
	Add Foreign Key (CategoryID) References [Category](CategoryID)
Alter Table [CourseSubject] with nocheck
	Add Foreign Key (SubjectID) References [Subject](SubjectID)
Alter Table [Course] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [DocProgress] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [QuizProgress] with nocheck
	Add Foreign Key (UserID) References [User](UserID)
Alter Table [DocProgress] with nocheck
	Add Foreign Key (CourseID, LessonID, DocID) References [LessonDoc](CourseID, LessonID, DocID)
Alter Table [QuizProgress] with nocheck
	Add Foreign Key (CourseID, LessonID, QuizID) References [Quiz](CourseID, LessonID, QuizID)

Insert Into [SEQuestion] Values 
(1, 'What do you like most?'),
(2, 'What is your favourite food?'),
(3, 'What is your father name?');

Insert Into [User] Values 
(0,	'server', 'JXG6Mrp0N4P3mZRc6jdqdQ==', 'YDo4yGPnyucaKgrZpDVx/A==', 0, 'server@mail.com', 'server', '2004-04-04', 2, 'server', 0, 1),
(1, 'admin', 'Sik3t3sJyIwKyiXhg0nliQ==', 'hR5dp9GHw3sEhqgL2O2aQA==', 1, 'admin@admin.com', 'PHQ', '04-04-2004', 1, 'Nothing', 1, 1),
(2, 'learner', 'M7SKm8rBe3wDjus9jNmQog==', '9DIWTddISRBjwaBpeRRDIQ==', 1, 'learner@learner.com', 'NBP', '04-04-2004', 1, 'Nothing', 4, 1),
(3, 'testcart', 'SVkAglOUIb6osRs8zi5IOQ==', 'GsOpy/dpdR4kwix0FSVDIA==', 0, 'testcart@testcart.com', 'NVL', '04-04-2004', 1, 'Nothing', 4, 1);

Insert Into [Subject] Values
(1, 'Elementary', 1),
(2, 'Web Develop', 1),
(3, 'Cooking', 1);

Insert Into [Category] Values
(1, 'Math', 1),
(2, 'English', 1),
(3, 'HTML', 1),
(4, 'Cooking', 1);

Insert Into [Course] Values 
(1, 'Math', 15, 'Math for Elementary Student', '06-09-2024', 1),
(2, 'English', 10, 'English for Elementary Student', '06-09-2024', 1),
(3, 'Basic Cooking', 10, 'Cooking for Starter', '06-20-2024', 1),
(4, 'Basic HTML', 10, 'HTML for Starter', '06-20-2024', 1);

Insert Into [CourseSubject] Values
(1, 1),
(2, 1),
(3, 3),
(4, 2);

Insert Into [CourseCategory] Values
(1, 1),
(2, 2),
(3, 4),
(4, 3);

Insert Into [Lesson] Values 
(1, 1, 'Math 1', 'Math Lesson 1'),
(1, 2, 'Math 2', 'Math Lesson 2'),
(2, 1, 'English 1', 'English Lesson 1'),
(2, 2, 'English 2', 'English Lesson 2');

Insert Into [Quiz] Values 
(1, 1, 1, 'Final Exam for Math 1', 2, 900, '06-09-2024'),
(1, 2, 1, 'Final Exam for Math 2', 2, 900, '06-09-2024'),
(2, 1, 1, 'Final Exam for English 1', 2, 900, '06-09-2024'),
(2, 2, 1, 'Final Exam for English 2', 2, 900, '06-09-2024');

Insert Into [Question] Values
(1, 1, 1, 1, '1 + 1 = ?', 'Nothing', 1),
(1, 1, 1, 2, '1 + 2 = ?', 'Nothing', 1),
(1, 2, 1, 1, '3 - 1 = ?', 'Nothing', 1),
(1, 2, 1, 2, '3 - 2 = ?', 'Nothing', 1),
(2, 1, 1, 1, 'You ___ Beautiful', 'Nothing', 1),
(2, 1, 1, 2, 'This ___ Cheap', 'Nothing', 1),
(2, 2, 1, 1, '___ Banana', 'Nothing', 1),
(2, 2, 1, 2, '___ Apple', 'Nothing', 1);

Insert Into [Answer] Values 
(1, 1, 1, 1, 1, '1', 1),
(1, 1, 1, 1, 2, '2', 2),
(1, 1, 1, 1, 3, '3', 1),
(1, 1, 1, 1, 4, '4', 1),

(1, 1, 1, 2, 1, '1', 1),
(1, 1, 1, 2, 2, '2', 1),
(1, 1, 1, 2, 3, '3', 2),
(1, 1, 1, 2, 4, '4', 1),

(1, 2, 1, 1, 1, '1', 1),
(1, 2, 1, 1, 2, '2', 2),
(1, 2, 1, 1, 3, '3', 1),
(1, 2, 1, 1, 4, '4', 1),

(1, 2, 1, 2, 1, '1', 2),
(1, 2, 1, 2, 2, '2', 1),
(1, 2, 1, 2, 3, '3', 1),
(1, 2, 1, 2, 4, '4', 1),

(2, 1, 1, 1, 1, 'Are', 2),
(2, 1, 1, 1, 2, 'Is', 1),
(2, 1, 1, 1, 3, 'The', 1),
(2, 1, 1, 1, 4, 'So', 1),

(2, 1, 1, 2, 1, 'Are', 1),
(2, 1, 1, 2, 2, 'Is', 2),
(2, 1, 1, 2, 3, 'The', 1),
(2, 1, 1, 2, 4, 'So', 1),

(2, 2, 1, 1, 1, 'One', 2),
(2, 2, 1, 1, 2, 'Two', 1),
(2, 2, 1, 1, 3, 'Three', 1),
(2, 2, 1, 1, 4, 'Four', 1),

(2, 2, 1, 2, 1, 'An', 2),
(2, 2, 1, 2, 2, 'A', 1),
(2, 2, 1, 2, 3, 'Many', 1),
(2, 2, 1, 2, 4, 'Ten', 1);

Insert Into [Feedback] Values
(1, 1, 1, '06-28-2024', 'Worthy Course')

Insert Into [LessonDoc] Values 
(1, 1, 1, 'Math Book 1', 'Math book volume 1', 'a.img');