//
//  ActionSheetView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//

import SwiftUI

struct ActionSheetView: View {
    
    @State private var showActionSheet = false
    @State private var selectedOption: String = "Show ActionSheet"
    
    var body: some View {
        Button(selectedOption) {
            showActionSheet = true
        }
        .actionSheet(isPresented: $showActionSheet) {
            ActionSheet(
                title: Text("Select Option"),
                buttons: [
                    .default(Text("Option 1"), action: option1),
                    .destructive(Text("Delete"), action: delete),
                    .cancel()
                ]
            )
        }
    }
    func option1(){
        selectedOption = "Option1"
    }
    func delete(){
        selectedOption = "Delete"
    }
    
}

#Preview {
    ActionSheetView()
}
