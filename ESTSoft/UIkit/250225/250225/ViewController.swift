//
//  ViewController.swift
//  250225
//
//  Created by 안세훈 on 2/24/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var nameButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(nameLabel)
        view.addSubview(nameButton)
    }
    
    
}

