//
//  Extension_UIView.swift
//  EST_PersonalMemo
//
//  Created by 안세훈 on 3/7/25.
//

import UIKit

extension UIView {
    func addSubviews(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}
