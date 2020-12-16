//
//  TaskData.swift
//  TaskApp (iOS)
//
//  Created by Romain Beaujean on 15/12/2020.
//

import Foundation

struct TaskData: Identifiable, Hashable {
       var id = UUID()
       var name: String
       var information = ""
       var taskDone: Bool
       var moreInformation = false
       
       var update: Bool {
              let update = taskDone
              
              return update
       }
       
       mutating func changeState() {
              self.taskDone.toggle()
       }
}
