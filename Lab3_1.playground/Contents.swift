struct Student {
    let firstName: String
    let lastName: String
    var averageGrade: Double
    
    init(firstName: String, lastName: String, averageGrade: Double) {
        self.firstName = firstName
        self.lastName = lastName
        self.averageGrade = averageGrade
    }
}

struct StudentJournal {
    var students: [Student] = []
    
    mutating func addStudent(_ student: Student) {
        students.append(student)
    }
    
    mutating func removeStudent(firstName: String, lastName: String) {
        students.removeAll { $0.firstName == firstName && $0.lastName == lastName }
    }
    
    func displayStudents() {
        for student in students {
            print("Name: \(student.firstName) \(student.lastName), GPA: \(student.averageGrade)")
        }
    }
    
    func averageGrade() -> Double {
        let total = students.reduce(0.0) { $0 + $1.averageGrade }
        return total / Double(students.count)
    }
    
    func highestGPAStudent() -> Student? {
        return students.max(by: { $0.averageGrade < $1.averageGrade })
    }
    
    mutating func listStudentsDescendingOrder() {
        students.sort { $0.averageGrade > $1.averageGrade }
    }
}

// Example usage
var journal = StudentJournal()
journal.addStudent(Student(firstName: "Alimkhan", lastName: "Sapargali", averageGrade: 3.4))
journal.addStudent(Student(firstName: "Bekzhan", lastName: "Charleston", averageGrade: 3.5))
journal.addStudent(Student(firstName: "Tokayev", lastName: "Ket", averageGrade: 3.8))

journal.listStudentsDescendingOrder()
journal.displayStudents()
print("Average Grade: \(journal.averageGrade())")
if let highestGPAStudent = journal.highestGPAStudent() {
    print("Student with Highest GPA: \(highestGPAStudent.firstName) \(highestGPAStudent.lastName)")
}
