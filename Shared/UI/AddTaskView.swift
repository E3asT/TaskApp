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
                                          }
                                   
                                   Spacer()
                                   Text("New task")
                                          .foregroundColor(.primary)
                                   
                                   Spacer()
                                   Text("Add")
                                          .foregroundColor(.secondary)
                            }
                            .font(.title2)
                            .padding(.horizontal, 16)
                            
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
}

struct AddTaskView_Previews: PreviewProvider {
       static var previews: some View {
              AddTaskView(action: .constant(true))
       }
}
