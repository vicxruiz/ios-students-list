//
//  Student.swift
//  Students
//
//  Created by Andrew R Madsen on 8/5/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String
    var firstName: String {
        return String(name.split(separator: " ")[0])
    }
    
    var lastName: String? {
        let result = name.split(separator: " ")
        if result.count == 1 {
            return nil
        } else {
            return String(result[1])
        }
    }
}
