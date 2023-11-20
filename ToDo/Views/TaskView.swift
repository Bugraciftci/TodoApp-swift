//
//  TaskView.swift
//  ToDo
//
//  Created by Muhammed Buğra on 19.11.2023.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realmManager: RealmManager
    var body: some View {
        VStack{
            Text("My tasks")
                .font(.title.bold())
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List{
                ForEach(realmManager.tasks, id: \.id){
                    task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                realmManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing){
                                Button(role: .destructive) {
                                    realmManager
                                        .deleteTask(id: task.id)
                                }label:{
                                    Label("Delete", systemImage: "trash")
                            }
                        }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance()
                    .backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.8))
    }
}

#Preview {
    TaskView()
        .environmentObject(RealmManager())
}
