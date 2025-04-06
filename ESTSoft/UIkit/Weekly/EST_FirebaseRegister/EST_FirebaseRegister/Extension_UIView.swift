//
//  Extension_UIView.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 4/6/25.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
