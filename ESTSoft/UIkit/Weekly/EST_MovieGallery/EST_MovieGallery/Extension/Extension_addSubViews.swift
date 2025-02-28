//
//  Extension_addSubViews.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import Foundation
import UIKit

//MARK: - addsubview(s)

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
