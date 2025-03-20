//
//  Expense.swift
//  SpendingTracker
//
//  Created by Hemant Shrestha on 20.03.25.
//
import Foundation

struct Expense: Identifiable {
    let title: String
    let description: String?
    let amount: Double
    let category: String
    let date: Date

    var id: Date {
        date
    }
}
