//
//  addReflection.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/7/25.
//

import Foundation

class addReflection{
    
    lazy var reflections: [String: Reflection] = [:]
    
    func addfunc(){
        print("::: 회고 추가 :::")
        commonFunction().inputDate()
        commonFunction().inputContent()
        print("::: 회고가 추가되었습니다. :::")
    }
    
}
