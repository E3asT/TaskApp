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
       @State var viewState = CGSize.zero
       
       var body: some View {
              ZStack {
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
                            
                            HStack() {
                                   Spacer()
                                   
                                   Image(systemName: "plus.circle.fill")
                                          .foregroundColor(.green)
                                          .onTapGesture {
                                                 action = true
                                          }
                                          .frame(width: 45, height: 45, alignment: .center)
                                          .background(Color.white)
                                          .clipShape(Circle())
                                          .shadow(color: Color.black.opacity(0.5), radius: 5, x: 0, y: 5)
                                   
                                   Spacer()
                            }
                            .font(.system(size: 45))
                            .padding(.bottom, 50)
                     }
                     
                     AddTaskView(action: $action, taskRow: $taskRow)
                            .cornerRadius(15)
                            .offset(y: action ? viewState.height : 1000)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0.0, y: -5)
                            .gesture(
                                   DragGesture()
                                          .onChanged { value in
                                                 viewState = value.translation
                                          }
                                          
                                          .onEnded { value in
                                                 if viewState.height >= 600 {
                                                        action = false
                                                 } else if viewState.height >= 100 {
                                                        viewState.height = 500
                                                 } else {
                                                        viewState = .zero
                                                 }
                                          }
                            )
                            .animation(.easeInOut)
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
