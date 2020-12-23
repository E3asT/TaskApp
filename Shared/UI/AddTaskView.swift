//
//  AddTaskView.swift
//  TaskApp
//
//  Created by Romain Beaujean on 22/12/2020.
//

import SwiftUI

struct AddTaskView: View {
       @State var title = ""
       @State var note = ""
       
       @Binding var action: Bool
       @Binding var taskRow: [TaskData]
       
       var body: some View {
              ZStack {
                     Color.white
                     
                     VStack(spacing: 20) {
                            Color.black.opacity(0.5)
                                   .frame(width: 45, height: 7)
                                   .cornerRadius(10)
                                   .padding(.vertical, 16)
                            
                            HStack {
                                   Text("Cancel")
                                          .foregroundColor(.blue)
                                          .onTapGesture {
                                                 action = false
                                                 clearTask()
                                          }
                                   
                                   Spacer()
                                   Text("New task")
                                          .foregroundColor(.primary)
                                   
                                   Spacer()
                                   Text("Add")
                                          .foregroundColor(addColor)
                            }
                            .font(.title2)
                            .padding(.horizontal, 16)
                            .onTapGesture {
                                   if title != "" {
                                          tapGesture()
                                   }
                            }
                            
                            VStack() {
                                   TextField("Title", text: $title)
                                   
                                   Divider()
                                   TextField("Note", text: $note)
                            }
                            .padding()
                            .foregroundColor(.primary)
                            .frame(width: 350, height: 250, alignment: .top)
                            .cornerRadius(7)
                            
                            Spacer()
                     }
              }
       }
       
       var addColor: Color {
              if title != "" { return Color.green }
              
              return Color.secondary
       }
       
       func addTask() {
              let newTitle = title
              let newNote = note
              let taskDone = false
              var isThereANote = false
              
              if newNote != "" {
                     isThereANote = true
              }
              
              taskRow.append(TaskData(title: newTitle, note: newNote, taskDone: taskDone, isThereNote: isThereANote))
       }
       
       func clearTask() {
              title = ""
              note = ""
       }
       
       func tapGesture() {
              addTask()
              clearTask()
              action = false
       }
}

struct AddTaskView_Previews: PreviewProvider {
       static var previews: some View {
              AddTaskView(action: .constant(true), taskRow: .constant([TaskData(title: "laal", taskDone: false)]))
       }
}
