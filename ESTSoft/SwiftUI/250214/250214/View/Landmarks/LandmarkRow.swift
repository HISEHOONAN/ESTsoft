//
//  LandmarkRow.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import SwiftUI

struct LandmarkRow: View {
    
    //Landmark 모델 사용
    var landmark : Landmark
    
    var body: some View {
        //수평
        HStack{
            landmark.image
                .resizable()
                .frame(width: 50,height: 50)
            Text(landmark.name)
            Spacer()
            
            if landmark.isFavorite {
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.yellow)
            }
        }
    }
}


#Preview {
    let landmarks = ModelData().landmarks
        return Group {
            LandmarkRow(landmark: landmarks[0])
            LandmarkRow(landmark: landmarks[1])
        }
}
