//
//  LandmarkDetail.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @Environment(ModelData.self) var modelData
    
    var landmark : Landmark
    
    var landmarkIndex : Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView{
            VStack{
                MapView(coordinate: landmark.locationCoordinate)
                    .frame(height: 300)
                
                CircleImage(image: landmark.image)
                    .offset(y : -130)
                    .padding(.bottom, -130)
                VStack(alignment: .leading){
                    HStack{
                        Text(landmark.name)
                            .font(.title)
                        FavoriteButton(isSet:  $modelData.landmarks[landmarkIndex].isFavorite)
                    }
                    
                    HStack {
                        Text(landmark.park)
                        Spacer()
                        Text(landmark.state)
                    }
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                    
                    
                    Divider()
                    
                    Text("\(landmark.name)에 대해서")
                        .font(.title3)
                    Text(landmark.description)
                }
                .padding()
                
                
                Spacer()
            }
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let modelData = ModelData()
    return LandmarkDetail(landmark: modelData.landmarks[0])
        .environment(modelData)
    
}
