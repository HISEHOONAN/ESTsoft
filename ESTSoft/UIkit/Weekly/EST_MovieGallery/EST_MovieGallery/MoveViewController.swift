//
//  MoveViewController.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/12/25.
//

import SnapKit
import UIKit

class MoveViewController : UIViewController {
    
    private let pushButton : UIButton = {
        let button = UIButton()
        button.setTitle("push", for: .normal)
        button.backgroundColor = .red
        button.addTarget(self, action: #selector(pushbutton), for: .touchUpInside)
        return button
    }()
    
    
    private let presentButton : UIButton = {
        let button = UIButton()
        button.setTitle("present", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(presentbutton), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        SetUI()
    }
    
    func SetUI(){
        view.addSubview(pushButton)
        view.addSubview(presentButton)
        
        pushButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
        presentButton.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.equalTo(pushButton.snp.bottom).offset(30)
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    @objc func pushbutton(){
        let vc = pushViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func presentbutton(){
        let vc = presentViewController()
        present(vc, animated: true)
    }
    
    
}

#Preview {
    MoveViewController()
}
