//
//  ViewController.swift
//  GoF-ProxyPattern
//
//  Created by 박준하 on 2023/04/06.
//

import UIKit

class Student {
    let id: Int
    var name: String
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
    }
}

protocol StudentDatabaseProtocol {
    func addStudent(_ student: Student)
    func getStudent(with id: Int) -> Student?
    func getAllStudents() -> [Student]
}

class StudentDatabase: StudentDatabaseProtocol {
    private var students = [Int: Student]()
    
    func addStudent(_ student: Student) {
        students[student.id] = student
    }
    
    func getStudent(with id: Int) -> Student? {
        return students[id]
    }
    
    func getAllStudents() -> [Student] {
        return Array(students.values)
    }
}


class ViewController: UIViewController, StudentDatabaseProtocol {
    
    private let database = StudentDatabase()
    private var isLoggedIn = false
    
    func login(username: String, password: String) -> Bool {
        // 로그인 처리
        isLoggedIn = true
        return isLoggedIn
    }
    
    func addStudent(_ student: Student) {
        guard isLoggedIn else {
            print("로그인을 먼저 해주세요")
            return
        }
        database.addStudent(student)
    }
    
    func getStudent(with id: Int) -> Student? {
        guard isLoggedIn else {
            print("로그인을 먼저 해주세요")
            return nil
        }
        return database.getStudent(with: id)
    }
    
    func getAllStudents() -> [Student] {
        guard isLoggedIn else {
            print("로그인을 먼저 해주세요")
            return []
        }
        return database.getAllStudents()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getAllStudents()
        print(login(username: "junha", password: "85817469!"))
        addStudent(Student(id: 1, name: "junha"))
        addStudent(Student(id: 2, name: "goodjunha"))
        addStudent(Student(id: 3, name: "hsfgadf"))
        
        print(getAllStudents())
    }
}
