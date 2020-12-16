//
//  ContentView.swift
//  Shared
//
//  Created by Romain Beaujean on 15/12/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
       @State var taskRow = [
              TaskData(name: "Bake cookies", taskDone: false),
              TaskData(name: "Clean the shower", taskDone: false),
              TaskData(name: "Dentiste", information: "At 9pm", taskDone: false, moreInformation: true),
              TaskData(name: "Have a beer", information: "At Leonard place", taskDone: false, moreInformation: true)
       ]
       @State var taskCount = 0
       
       var body: some View {
              VStack {
                     BannerView(taskRow: $taskRow ,taskCount: $taskCount)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 16)
                     
                     Spacer()
                     List {
                            ForEach(taskRow) { task in
                                   CellTaskView(task: task, taskCount: $taskCount)
                            }
                     }
              }
       }
}

struct ContentView_Previews: PreviewProvider {
       static var previews: some View {
              ContentView()
              
       }
}

struct BannerView: View {
       @Binding var taskRow: [TaskData]
       @Binding var taskCount: Int
       
       var body: some View {
              VStack {
                     HStack {
                            Text("Today")
                            
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                   .foregroundColor(.green)
                                   .onTapGesture {
                                          addArray()
                                   }
                     }
                     .font(.title)
                     .padding(.bottom, 10)
                     
                     HStack {
                            if taskRow.count == taskCount {
                                   Text("All tasks are done")
                            } else if taskCount > 0 {
                                   Text("\(taskCount) tasks done")
                            } else {
                                   Text("\(taskCount) task done")
                            }
                            
                            Spacer()
                     }
                     .font(.footnote)
              }
       }
       
       func addArray() {
              let name = "Listen the new Billy Elish album"
              let information = "On Apple Music"
              let moreInformation = true
              let taskDone = false
              let newTask = TaskData(name: name, information: information, taskDone: taskDone, moreInformation: moreInformation)
              
              taskRow.append(newTask)
       }
}
