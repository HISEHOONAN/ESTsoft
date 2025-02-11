//
//  ProductListView.swift
//  250211_proj
//
//  Created by 안세훈 on 2/11/25.
//


import SwiftUI

struct ProductListView: View {
    
    @StateObject private var productLoader = ProductDataLoader()
    
    var body: some View {
        List(productLoader.products) { product in
            NavigationLink(destination: ProductDetailView(product: product)){
                ProductRow(product: product)
            }
        }
        
    }
}
