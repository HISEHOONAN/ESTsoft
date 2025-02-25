//
//  ViewModel.swift
//  250225 Combine
//
//  Created by 안세훈 on 2/24/25.
//
import Combine
import Foundation

class ViewModel : ObservableObject {
    
    //MARK: - 기본적인 알람
    @Published var time : String = ""
    @Published var alarmOn : Bool = false
    @Published var days : [String] = []
    
    //MARK: - 알람의 유효성 검사 EX)요일이 아예없다 등
    @Published var daysValid : Bool = false
    
    private var cancellables : Set<AnyCancellable> = []
    
    private init(){
        //MARK: -

        
    }
}

