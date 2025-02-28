//
//  ViewController.swift
//  250225
//
//  Created by 안세훈 on 2/24/25.
//

import UIKit

class ViewController: UIViewController{
    
    //MARK: - tableview
    
    let exIndex = [1,2,3,4,5,6,7,8,9]
    
    let tableview = UITableView()
    
    let collectionview = UICollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        collectionview.delegate = self
        collectionview.dataSource = self
        tableview.dataSource = self
        
    }
}

//MARK: - extension VC
extension ViewController : UITableViewDelegate,UITableViewDataSource,
                           UICollectionViewDelegate,UICollectionViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    

}
