//
//  Expense.swift
//  SpendingTracker
//
//  Created by Hemant Shrestha on 20.03.25.
//
import Foundation
import SwiftData

@Model
final class Expense: Identifiable {
    var id = UUID()

    var title: String
    var note: String?
    var amount: Double
    var category: String?
    var date: Date

    init(title: String, note: String?, amount: Double, category: String?, date: Date) {
        self.title = title
        self.note = note
        self.amount = amount
        self.category = category
        self.date = date
    }
}
