//
//  ContentView.swift
//  250213
//
//  Created by 안세훈 on 2/13/25.
//

import SwiftUI

struct ContentView: View {
    //사용자 정보
    @State private var userName : String = ""
    @State private var userAge : String = ""
    @State private var isDarkMode : Bool = false
    @State private var fruits: [String] = []
    
    let favoriteFruits = ["Apple", "Banana", "Cherry, Dragon Fruit"]
    
    var body: some View {
        VStack{
            Button("저장하기") {
                UserDefaults.standard.set(favoriteFruits, forKey: "favoriteFruits")
                print("저장된 과일: \(favoriteFruits)")
            }
            Button("불러오기") {
                if let loadedFruits = UserDefaults.standard.array(forKey: "favoriteFruits") as? [String] {
                    fruits = loadedFruits
                    print("불러온 과일: \(loadedFruits)")
                } else {
                    print("저장된 데이터가 없습니다.")
                }
            }
            Text("불러온 과일: \(fruits.joined(separator: ", "))")
                .padding()
        }
        
        
        
        NavigationView {
            Form {
                Section(header: Text("사용자 정보")){
                    TextField("이름", text: $userName)
                    TextField("나이", text: $userAge)
                }
                Section(header: Text("다크 모드 설정")){
                    Toggle("다크 모드 설정",isOn: $isDarkMode)
                }
                Section{
                    Button("데이터 저장하기"){
                        print("저장 버튼 ")
                    }
                    Button("데이터 불러오기"){
                        print("불러오기 버튼")
                    }
                }
            }
        }
    }
    
    //MARK: - 저장 기능
    func saveData(){
        UserDefaults.standard.set(userName, forKey: "userName")
        UserDefaults.standard.set(userAge, forKey: "userAge")
        UserDefaults.standard.set(isDarkMode, forKey: "isDarkMode")
    }
    
    //MARK: - 불러오기 기능
    func loadData(){
        userName = UserDefaults.standard.string(forKey: "userName") ?? ""
        
        userAge = UserDefaults.standard.string(forKey: "userAge") ?? ""
        
        isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
    }
    
}

#Preview {
    ContentView()
}
