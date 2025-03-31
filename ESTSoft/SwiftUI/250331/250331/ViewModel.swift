//
//  ViewModel.swift
//  250331
//
//  Created by 안세훈 on 3/31/25.
//
import SwiftUI
import Combine

class ViewModel : ObservableObject {
    @Published var UserInfo : [Model] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        fetchUserInfo()
    }
    
    func fetchUserInfo(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data) //모든 데이터를
            .decode(type: [Model].self, decoder: JSONDecoder())
            //모델의 구조체를 따라서 Json으로 디코딩
            .replaceError(with: [])
            //에러는 빈 배열로 처리
            .receive(on: DispatchQueue.main)
            //메인쓰레드에서 받고
            .assign(to: &$UserInfo)
            //UserInfo에 할당.
    }
    
    
}
