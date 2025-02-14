//
//  Data.swift
//  250214
//
//  Created by 안세훈 on 2/14/25.
//

import Foundation

@Observable
class ModelData {
    //load를 통해 json파일을 로딩한 후 landmarks 배열에 저장.
    var landmarks : [Landmark]  = load("landmarkData.json")
}

func load<T : Decodable>(_ filename : String) -> T{
    let data : Data
    
    //번들 파일에서 filename 가져오기
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("\(filename)를 찾을 수 없습니다.")
    }
    
    //로드 에러 감지
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("\(filename)을 로드 할 수 없습니다.\(error)")
    }
    
    //파싱 에러 감지
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }catch{
        fatalError("\(filename)을 \(T.self)로 파싱할 수 없습니다. :\n\(error)")
    }
}
