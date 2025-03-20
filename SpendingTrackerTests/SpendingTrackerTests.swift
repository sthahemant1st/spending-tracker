//
//  SpendingTrackerTests.swift
//  SpendingTrackerTests
//
//  Created by Hemant Shrestha on 20.03.25.
//

import Foundation
import Testing
@testable import SpendingTracker

struct SpendingTrackerTests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
        let title = "Expense title"
        let description = "Expense description"
        let amount: Double = 100.0
        let category: String = "Groceries"
        let date: Date = .now
        
        let expense = Expense(
            title: title,
            description: description,
            amount: amount,
            category: category,
            date: date
        )
        
        #expect(expense.title == title)
        #expect(expense.description == description)
        #expect(expense.amount == amount)
        #expect(expense.category == category)
        #expect(expense.date == date)
    }

}
