//
// AppCoordinator.swift
// MyHabits_App
// 
// Created by Maxim Abakumov on 2021. 04. 16.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

class AppCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    
    private(set) var tabBarController: TabBarViewController
    
    init(navigation: TabBarViewController) {
        tabBarController = navigation
    }
    
    func start() {
        
        let habitsStack = prepareHabitsFlow()
        let infoStack = prepareInfoFlow()
        
        tabBarController.viewControllers = [habitsStack, infoStack]
        
        let habitsCoordinator = HabitsCoordinator(
            navigation: habitsStack)
        childCoordinators.append(habitsCoordinator)
        habitsCoordinator.start()
    }
    
    private func prepareHabitsFlow() -> UINavigationController {
        let habitsStack = UINavigationController()
        let habitsItem = makeTabBarItem(
            image: UIImage(systemName: "rectangle.grid.1x2") ?? UIImage(),
            selectedImage: UIImage(systemName: "rectangle.grid.1x2.fill") ?? UIImage(),
            title: "Привычки")
        habitsStack.tabBarItem = habitsItem
        
        return habitsStack
    }
    
    private func prepareInfoFlow() -> UINavigationController {
        let infoStack = UINavigationController(rootViewController: InfoViewController())
        
        let infoItem = makeTabBarItem(
            image: UIImage(systemName: "info.circle") ?? UIImage(),
            selectedImage: UIImage(systemName: "info.circle.fill") ?? UIImage(),
            title: "Информация")
        
        infoStack.tabBarItem = infoItem
        
        return infoStack
    }
}

extension AppCoordinator {
    
    private func makeTabBarItem(
        image: UIImage,
        selectedImage: UIImage,
        title: String
    ) -> UITabBarItem {
        return UITabBarItem(
            title: title,
            image: image,
            selectedImage: selectedImage
        )
    }
}
