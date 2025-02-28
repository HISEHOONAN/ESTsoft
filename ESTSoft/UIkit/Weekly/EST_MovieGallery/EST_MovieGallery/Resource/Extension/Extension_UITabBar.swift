//
//  Extension_UITabBar.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//
import UIKit

extension UITabBar {
    override open func sizeThatFits(_ size: CGSize) -> CGSize {
    var sizeThatFits = super.sizeThatFits(size)
    sizeThatFits.height = 100 // 원하는 길이
    return sizeThatFits
   }
}
