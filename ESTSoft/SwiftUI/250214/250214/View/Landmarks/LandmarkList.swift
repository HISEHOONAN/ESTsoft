//
//  LandmarkList.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct LandmarkList: View {
    @Environment(ModelData.self) var data
    @State private var showFavoritesOnly = false
    
    var filteredLandmarks : [Landmark] {
        data.landmarks.filter { landmark in
            (!showFavoritesOnly || landmark.isFavorite)
            
            
        }
    }
    
    
    var body: some View {
        NavigationSplitView {
            List{
                Toggle(isOn: $showFavoritesOnly){
                    Text("Favorites Only")
                }
                ForEach(filteredLandmarks) { landmark in
                NavigationLink{
                    LandmarkDetail(landmark: landmark)
                }label: {
                    LandmarkRow(landmark: landmark)
                }
            }
                .animation(.default, value: filteredLandmarks)
            .navigationTitle("Landmarks")
            }
        }detail: {
            Text("Select a Lanmark")
        }
            
    }
}

#Preview {
    LandmarkList()
}
