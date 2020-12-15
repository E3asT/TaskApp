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

var taskRow = [
       TaskData(name: "Bake cookies", taskDone: false),
       TaskData(name: "Clean the shower", taskDone: false),
       TaskData(name: "Dentiste", information: "At 9pm", taskDone: false, moreInformation: true),
       TaskData(name: "Have a beer", information: "At Leonard place", taskDone: false, moreInformation: true)
]
