//
//  CellTaskView.swift
//  TaskApp (iOS)
//
//  Created by Romain Beaujean on 15/12/2020.
//

import SwiftUI

struct CellTaskView: View {
       @State var task: TaskData
       @Binding var taskCount: Int
       
       var body: some View {
              HStack(alignment: .top, spacing: 10) {
                     Image(systemName: task.update ? "largecircle.fill.circle" : "circle")
                            .foregroundColor(.secondary)
                            .onTapGesture {
                                   task.changeState()
                                   
                                   if task.update {
                                          taskCount += 1
                                   } else {
                                          taskCount -= 1
                                   }
                            }
                     
                     VStack(alignment: .leading, spacing: 5) {
                            Text(task.title)
                                   .foregroundColor(task.update ? .secondary : .primary)
                            
                            if task.isThereNote {
                                   Text(task.note)
                                          .foregroundColor(.secondary)
                                          .font(.footnote)
                            }
                     }
                     
                     Spacer()
              }
              .padding(.all, 10)
       }
}

struct CellTaskView_Previews: PreviewProvider {
       static var previews: some View {
              CellTaskView(task: TaskData(title: "Dentiste", note: "At 9pm", taskDone: false, isThereNote: true), taskCount: .constant(1))
       }
}

