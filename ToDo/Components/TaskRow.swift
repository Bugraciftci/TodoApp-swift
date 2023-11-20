//
//  TaskRow.swift
//  ToDo
//
//  Created by Muhammed Buğra on 19.11.2023.
//

import SwiftUI

struct TaskRow: View {
    
    var task: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: completed ? "checkmark.circle": "circle")
            Text(task)
        }
    }
}

#Preview {
    TaskRow(task: "Do Laundry", completed: true)
}
