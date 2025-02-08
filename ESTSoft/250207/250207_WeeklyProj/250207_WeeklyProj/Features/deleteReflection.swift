//
//  deleteReflection.swift
//  250207_WeeklyProj
//
//  Created by 안세훈 on 2/7/25.
//

import Foundation

class deleteReflection {
    
    lazy var reflections: [String: Reflection] = [:]
    
    func deletefunc(){
        print("::: 회고 삭제 :::")
        commonFunction().inputDate()
        
        print("::: 회고가 삭제되었습니다. :::")
    }
    
}
