//
//  ContentView.swift
//  Shared
//
//  Created by Romain Beaujean on 15/12/2020.
//

import SwiftUI
import CoreData

struct ContentView: View {
       @State var taskCount = 0
       
       var body: some View {
              VStack {
                     BannerView(taskCount: $taskCount)
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
                            if taskCount > 0 {
                                   Text("\(taskCount) tasks done")
                                          .font(.footnote)
                            } else {
                                   Text("\(taskCount) task done")
                                          .font(.footnote)
                            }
                            
                            Spacer()
                     }
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
