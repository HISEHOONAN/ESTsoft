//
//  MainTabBarController.swift
//  EST_MovieGallery
//
//  Created by 안세훈 on 2/28/25.
//

import UIKit
import SnapKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        SetupTabbar()
        SetupViews()
    }
    
    //MARK: - 탭바뷰 설정
    private func SetupTabbar(){
        UITabBar.appearance().tintColor = .black
        UITabBar.appearance().unselectedItemTintColor = UIColor.gray
        UITabBar.appearance().backgroundColor = .black
    }
    
    //MARK: - 탭바 설정
    private func SetupViews(){
        //탭바 아이템
        let dailytabBar = UITabBarItem(title: "일별 박스오피스", image: UIImage(systemName: "popcorn"), selectedImage: UIImage(systemName: "popcorn.fill"))
        
        let weeklytabBar = UITabBarItem(title: "주간 박스오피스", image: UIImage(systemName: "movieclapper"), selectedImage:UIImage(systemName: "movieclapper.fill"))
        
        //탭바 연결
        let dailyVC = generateNavController(vc: DailyViewController(), tabBarItem: dailytabBar)
        
        let weeklyVC = generateNavController(vc: WeeklyViewContoller(), tabBarItem: weeklytabBar)
        
        self.viewControllers = [dailyVC, weeklyVC]
        self.selectedIndex = 0
    }
    
    //MARK: - VC + TabbarItem에 navigationContoller 맥이기 + 네비게이션바는 지우기
    fileprivate func generateNavController(vc: UIViewController, tabBarItem: UITabBarItem) -> UINavigationController {
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = tabBarItem
        navController.navigationBar.isHidden = true
        return navController
    }
}

#Preview {
    MainTabBarController()
}
