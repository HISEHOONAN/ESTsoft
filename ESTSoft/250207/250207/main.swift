//
//  main.swift
//  250207
//
//  Created by 안세훈 on 2/7/25.
//

import Foundation

class Product {
    func displayInfo(){
        
    }
}

var productlist: [Product] = []

class Car: Product {
    var brand: String
    var model: String
    
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
    
    // 브랜드와 모델을 출력
    override func displayInfo() {
        print("\(brand) \(model)")
    }
}

class Book: Product {
    
    var title: String
    var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }
    
    // 제목과 저자를 출력
    override func displayInfo() {
        print("\(title) by \(author)")
    }
}

productlist.append(Car(brand: "bmw", model: "x5"))
productlist.append(Book(title: "북", author: "북북"))

for product in productlist {
    product.displayInfo()
}
