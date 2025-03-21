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

    @Test func testExpenseInitialization() async throws {
        let title = "Expense title"
        let note = "Expense description"
        let amount: Double = 100.0
        let category: String = "Groceries"
        let date: Date = .now

        let expense = Expense(
            title: title,
            note: note,
            amount: amount,
            category: category,
            date: date
        )

        #expect(expense.title == title)
        #expect(expense.note == note)
        #expect(expense.amount == amount)
        #expect(expense.category == category)
        #expect(expense.date == date)
    }

    @Test func testExpenseInitialization_withNilNoteAndCategory() async throws {
        let title = "Expense title"
        let note: String? = nil
        let amount: Double = 100.0
        let category: String? = nil
        let date: Date = .now

        let expense = Expense(
            title: title,
            note: note,
            amount: amount,
            category: category,
            date: date
        )

        #expect(expense.title == title)
        #expect(expense.note == note)
        #expect(expense.amount == amount)
        #expect(expense.category == category)
        #expect(expense.date == date)
    }

}
