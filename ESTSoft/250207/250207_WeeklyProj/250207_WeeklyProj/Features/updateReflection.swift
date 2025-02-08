//
//  updateReflection.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/7/25.
//

import Foundation

class updateReflection {
    
    lazy var reflections: [String: Reflection] = [:]
    
    func updatefunc(){
        print("::: 회고 수정 :::")
        commonFunction().inputDate()
        print("::: 회고가 수정되었습니다.. :::")
    }
    
}
