//
//  TaskData.swift
//  TaskApp (iOS)
//
//  Created by Romain Beaujean on 15/12/2020.
//

import Foundation

struct TaskData: Identifiable, Hashable {
       var id = UUID()
       var title: String
       var note = ""
       var taskDone: Bool
       var isThereNote = false
       
       var update: Bool {
              let update = taskDone
              
              return update
       }
       
       mutating func changeState() {
              self.taskDone.toggle()
       }
}
