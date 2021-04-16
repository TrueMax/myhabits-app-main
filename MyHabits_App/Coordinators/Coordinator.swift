//
// Coordinator.swift
// MyHabits_App
// 
// Created by Maxim Abakumov on 2021. 04. 16.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import Foundation

protocol Coordinator {
    
    var childCoordinators: [Coordinator] { get set }
    func start()
}
