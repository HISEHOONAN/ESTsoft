//
//  presentViewController.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/12/25.
//

import UIKit
import SnapKit

class presentViewController: UIViewController {
    
     let Label : UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let dismissButton : UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dismiss", for: .normal)
        button.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        view.addSubview(Label)
        view.addSubview(dismissButton)
        
        Label.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        
        dismissButton.snp.makeConstraints{
            $0.center.equalToSuperview().inset(10)
        }
        
    }
    
    @objc func dismissAction(){
        self.dismiss(animated: true)
    }
}

#Preview {
    presentViewController()
}
