//
//  MainViewController.swift
//  Students
//
//  Created by Victor  on 5/6/19.
//  Copyright © 2019 Lambda Inc. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var sortSelector: UISegmentedControl!
    
    private let networkClient = NetworkClient()
    
    private var studentsTableViewController: StudentTableViewController!
    
    private var students: [Student] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkClient.fetchStudents { (students, error) in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.students = students ?? []
            }
        }
    }
        
        
        private func updateSort() {
            let sortedStudents: [Student]
            if sortSelector.selectedSegmentIndex == 0 {
                sortedStudents = students.sorted { $0.firstName < $1.firstName }
            } else {
                sortedStudents = students.sorted { ($0.lastName ?? "") < ($1.lastName ?? "") }
            }
            //studentsTableViewController.students = sortedStudents
        }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "EmbedStudentsTableView" {
            studentsTableViewController = segue.destination as! StudentTableViewController
        }
    }

    }


