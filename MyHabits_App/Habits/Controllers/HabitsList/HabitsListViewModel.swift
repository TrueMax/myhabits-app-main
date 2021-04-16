//
// HabitsListViewModel.swift
// MyHabits_App
// 
// Created by Maxim Abakumov on 2021. 04. 16.
//
// Copyright © 2020, Maxim Abakumov. MIT License.
//

import UIKit

class HabitsListViewModel: HabitsViewOutput {
    
    weak var viewInput: HabitsViewInput?
    
    func showHabits() {
        viewInput?.reloadData()
    }
}
