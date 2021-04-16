//
// HabitsCoordinator.swift
// MyHabits_App
// 
// Created by Maxim Abakumov on 2021. 04. 16.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

class HabitsCoordinator: Coordinator {
    
    var childCoordinators: [Coordinator] = []
    lazy var onDismiss: (() -> Void) = {
        self.navigationController.dismiss(animated: true, completion: nil)
        self.viewModel.showHabits()
    }
    
    private let navigationController: UINavigationController
    private let viewModel = HabitsListViewModel()
    private lazy var controller: HabitsViewController = {
        let controller = HabitsViewController(viewModel: viewModel)
        viewModel.viewInput = controller
        
        return controller
    }()
    
    init(navigation: UINavigationController) {
        navigationController = navigation
    }
    
    func start() {
        
        controller.coordinator = self
        navigationController.pushViewController(
            controller,
            animated: true
        )
    }
    
    func addNewHabit() {
        let habitVC = HabitViewController(isInEditMode: false)
        habitVC.coordinator = self
        let habitNavC = UINavigationController(rootViewController: habitVC)
        habitVC.modalPresentationStyle = .fullScreen
        navigationController.present(
            habitNavC,
            animated: true,
            completion: nil)
    }
    
    func showHabitDetails(index: Int) {
        let habitDetailsVC = HabitDetailsViewController()
        let habit = HabitWithIndex(customHabit: HabitsStore.shared.habits[index], habitIndex: index)
        habitDetailsVC.habit = habit
        
        navigationController.pushViewController(habitDetailsVC, animated: true)
    }
}
