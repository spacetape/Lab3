struct Task {
    let title: String
    let description: String
    var isCompleted: Bool
    
    init(title: String, description: String, isCompleted: Bool = false) {
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
    }
}

struct ToDoList {
    var tasks: [Task] = []
    
    mutating func addTask(_ task: Task) {
        tasks.append(task)
    }
    
    mutating func removeTask(title: String) {
        tasks.removeAll { $0.title == title }
    }
    
    mutating func changeTaskStatus(title: String, isCompleted: Bool) {
        if let index = tasks.firstIndex(where: { $0.title == title }) {
            tasks[index].isCompleted = isCompleted
        }
    }
    
    func displayTasks() {
        for task in tasks {
            print("Title: \(task.title), Description: \(task.description), Completed: \(task.isCompleted)")
        }
    }
    
    func completedTasks() -> [Task] {
        return tasks.filter { $0.isCompleted }
    }
    
    func outstandingTasks() -> [Task] {
        return tasks.filter { !$0.isCompleted }
    }
    
    mutating func clearCompletedTasks() {
        tasks = tasks.filter { !$0.isCompleted }
    }
}

// Example usage
var todoList = ToDoList()
todoList.addTask(Task(title: "Task 1", description: "Change the government in Kazakhstan"))
todoList.addTask(Task(title: "Task 2", description: "Eat pelmeni"))
todoList.addTask(Task(title: "Task 3", description: "Tea time with democratic new government"))
todoList.addTask(Task(title: "Task 4", description: "Help mom with laundry"))

todoList.changeTaskStatus(title: "Task 1", isCompleted: true)
todoList.changeTaskStatus(title: "Task 3", isCompleted: true)

print("All Tasks:")
todoList.displayTasks()

print("\nCompleted Tasks:")
for task in todoList.completedTasks() {
    print("Title: \(task.title), Description: \(task.description)")
}

print("\nOutstanding Tasks:")
for task in todoList.outstandingTasks() {
    print("Title: \(task.title), Description: \(task.description)")
}
print("\nClearing Completed Tasks...")
todoList.clearCompletedTasks()

print("\nAll Tasks:")
todoList.displayTasks()
