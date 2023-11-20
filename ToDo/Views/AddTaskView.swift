//
//  AddTaskView.swift
//  ToDo
//
//  Created by Muhammed Buğra on 19.11.2023.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var realmManager : RealmManager
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            Text("Create a new tasks")
                .font(.title3).bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here", text: $title)
                .textFieldStyle(.roundedBorder)
            
            Button{
                if title != ""{
                    realmManager.addTask(taskTitle: title)
                }
                dismiss()
            }label: {
                Text("Add task")
                    .foregroundStyle(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.indigo)
                    .cornerRadius(30)
            }
            Spacer()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.8))
    }
}

#Preview {
    AddTaskView()
        .environmentObject(RealmManager())
}
