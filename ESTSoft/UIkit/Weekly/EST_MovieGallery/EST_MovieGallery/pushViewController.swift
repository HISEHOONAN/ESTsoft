//
//  pushViewConteoller.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 3/12/25.
//
import UIKit
import SnapKit

class pushViewController: UIViewController {
    
    private let popButton : UIButton = {
        let button = UIButton()
        button.setTitle("pop", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(poped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        view.addSubview(popButton)
        setUI()
    }
    
    func setUI(){
        popButton.snp.makeConstraints{
            $0.center.equalToSuperview()
            $0.width.equalTo(100)
            $0.height.equalTo(50)
        }
    }
    
    @objc func poped(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
