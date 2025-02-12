//
//  HomeView.swift
//  250212
//
//  Created by 안세훈 on 2/12/25.
//


import SwiftUI


struct HomeView: View {
    
    @State var widthInt : CGFloat = 100
    @State var heightInt : CGFloat = 100
    @State var message : String = "Hello, World!"
    
    var body: some View {
        VStack {
            Image(systemName: "house.fill")
                .resizable()
                .frame(width: widthInt, height: heightInt)
            Text(message)
            HStack{
                Button("너비"){
                    width()
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color.blue)
                .cornerRadius(15)
                
                Button("높이"){
                    height()
                }
                .padding()
                .foregroundStyle(.white)
                .background(Color.blue)
                .cornerRadius(15)
            }
            
        }
        .padding()
    }
    
    func width(){
        message = "너비 버튼"
        widthInt = widthInt + 1
    }
    func height(){
        message = "높이 버튼"
        heightInt = heightInt + 1
    }
}


#Preview {
    HomeView()
}
