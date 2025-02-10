//
//  ContentView.swift
//  250210
//
//  Created by 안세훈 on 2/10/25.
//

import SwiftUI

struct ContentView: View {
    
    @State private var words: [String] = []   // 단어를 저장할 배열
    @State private var newWord: String = ""  // 새로 입력할 단어
    @State private var wordToDelete: String = "" // 삭제할 단어
    @State private var message: String = "단어를 추가해주세요."  // 상태 메시지
    
    var body: some View {
        VStack {
            Text("Array 관리 프로그램")
                .font(.largeTitle)
                .padding(5).background(.cyan).cornerRadius(10)
            //MARK: - 단어 추가
            HStack{
                TextField("추가 혹은 검색할 단어 입력", text: $newWord).textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                Button("추가"){
                    addWord()
                }.foregroundStyle(.blue)
                    .padding(5)
                    .background(.yellow)
                    .cornerRadius(5)
                Button("검색"){
                    findWord()
                }.padding(5)
                    .background(.yellow)
                    .cornerRadius(5)
                    .padding(10)
            }
            //MARK: - 리스트
            List(words, id: \.self){ word in
                Text(word)
            }.padding(10)
             .cornerRadius(40)
             .animation(Animation.easeInOut(duration: 0.5))
            //MARK: - 단어 삭제
            HStack{
                TextField("삭제할 단어를 입력해주세요.", text: $wordToDelete).textFieldStyle(RoundedBorderTextFieldStyle()).padding(10)
                Button("삭제"){
                    deleteWord()
                }.foregroundStyle(.red)
            }.padding(10)
        }
        Text(message)
            .padding(5).foregroundStyle(.red)
        Text("\(words.count)개의 단어가 존재합니다.")
            .padding(5).foregroundStyle(.cyan)
    }
    //MARK: - 단어 추가 함수
    func addWord(){
        if words.contains(newWord){
            message = "\(newWord)는 이미 추가되어있습니다."
            newWord = ""
        }else{
            if newWord != ""{
                words.append(newWord)
                //words는 @state로 인해 상태를 자동으로 감지해서 적용.
                message = "단어가 추가되었습니다."
            }else{
                message = "단어를 입력해주세요."
            }
            newWord = ""
        }
    }
    
    //MARK: - 단어 삭제 함수
    func deleteWord(){
        //입력된 단어와 일치하는 단어를 firstIndex(of : )를 통해 찾기
        //remove()를 이용해 지우기
        if let index = words.firstIndex(of: wordToDelete){
            words.remove(at: index)
            message = "\(wordToDelete) 단어가 삭제되었습니다."
        }else{
            if wordToDelete == ""{
                message = "삭제할 단어를 입력해주세요."
            }else{
                message = "\(wordToDelete) 단어가 존재하지 않습니다."
            }
        }
        wordToDelete = ""
    }
    //MARK: - 단어 찾기
    func findWord(){
        if let index = words.firstIndex(of: newWord){
            message = "\(newWord) 단어는 \(index)번째에 있습니다."
        }else{
            message = "\(newWord) 단어가 존재하지 않습니다."
        }
        newWord = ""
    }
    
}

#Preview {
    ContentView()
}
