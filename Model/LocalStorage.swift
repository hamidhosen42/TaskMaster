//
//  LocalStorage.swift
//  TaskMaster
//
//  Created by Project2Morrow on 8/3/25.
//

import Foundation

class LocalStorage {
    private let tasksKey = "savedTasks"
    
    func saveTasks(_ tasks: [Task]) {
        if let encodedData = try? JSONEncoder().encode(tasks) {
            UserDefaults.standard.set(encodedData, forKey: tasksKey)
        }
    }
    
    func loadTasks() -> [Task] {
        if let savedData = UserDefaults.standard.data(forKey: tasksKey),
           let decodedTasks = try? JSONDecoder().decode([Task].self, from: savedData) {
            return decodedTasks
        }
        return []
    }
}
