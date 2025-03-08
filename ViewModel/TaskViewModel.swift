//
//  TaskViewModel.swift
//  TaskMaster
//
//  Created by Project2Morrow on 8/3/25.
//

import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []
    private let storage = LocalStorage()
    
    init() {
        loadTasks()
    }
    
    func addTask(title: String) {
        let newTask = Task(title: title)
        tasks.append(newTask)
        saveTasks()
    }
    
    func toggleTaskCompletion(id: UUID) {
        if let index = tasks.firstIndex(where: { $0.id == id }) {
            tasks[index].isCompleted.toggle()
            saveTasks()
        }
    }
    
    func deleteTask(at indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
        saveTasks()
    }
    
    private func saveTasks() {
        storage.saveTasks(tasks)
    }
    
    private func loadTasks() {
        tasks = storage.loadTasks()
    }
}
