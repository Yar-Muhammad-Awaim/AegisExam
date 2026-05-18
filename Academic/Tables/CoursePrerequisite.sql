CREATE TABLE [Academic].CoursePrerequisite
(
    CourseId INT NOT NULL,
    PrereqCourseId INT NOT NULL,
    MinGrade VARCHAR(5),
    CONSTRAINT PK_CoursePrerequisite PRIMARY KEY (CourseId, PrereqCourseId),
    CONSTRAINT FK_CoursePrerequisite_Course FOREIGN KEY (CourseId) REFERENCES [Academic].Course(CourseId),
    CONSTRAINT FK_CoursePrerequisite_PrereqCourse FOREIGN KEY (PrereqCourseId) REFERENCES [Academic].Course(CourseId)
);
GO