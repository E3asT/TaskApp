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
              TaskData(title: "Bake cookies", taskDone: false),
              TaskData(title: "Clean the shower", taskDone: false),
              TaskData(title: "Dentiste", note: "At 9pm", taskDone: false, isThereNote: true),
              TaskData(title: "Have a beer", note: "At Leonard place", taskDone: false, isThereNote: true)
       ]
       @State var taskCount = 0
       @State var action = false
       
       var body: some View {
              ZStack {
                     VStack {
                            BannerView(taskRow: $taskRow ,taskCount: $taskCount, action: $action)
                                   .padding(.vertical, 10)
                                   .padding(.horizontal, 16)
                            
                            Spacer()
                            List {
                                   ForEach(taskRow) { task in
                                          CellTaskView(task: task, taskCount: $taskCount)
                                   }
                            }
                     }
                     
                     AddTaskView(action: $action)
                            .cornerRadius(15)
                            .offset(y: action ? 0 : 1000)
                            .shadow(color: Color.black.opacity(0.2), radius: 7, x: 0.0, y: -5)
                            .animation(.spring())
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
       @Binding var action: Bool
       
       var body: some View {
              VStack {
                     HStack {
                            Text("Today")
                            
                            Spacer()
                            Image(systemName: "plus.circle.fill")
                                   .foregroundColor(.green)
                                   .onTapGesture {
                                          action = true
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
}
