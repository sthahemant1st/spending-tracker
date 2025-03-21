//
//  HomeScreen.swift
//  SpendingTracker
//
//  Created by Hemant Shrestha on 21.03.25.
//

import SwiftUI

struct HomeScreen: View {
    @State private var expenses: [Expense] = Expense.mockItems
    @State private var isDeleteConfirmationDialogShown: Bool = false
    @State private var deleteConformationShownFor: Expense?

    var body: some View {
        NavigationStack {
            List(expenses) { expense in
                ExpenseItemView(expense: expense)
                    .swipeActions(allowsFullSwipe: false) {
                        Button("Edit", systemImage: "pencil.and.list.clipboard") {
                            editSwipeActionTapped(for: expense)
                        }
                        .tint(.blue)
                        Button("Delete", systemImage: "trash") {
                            deleteSwipeActionTapped(for: expense)
                        }
                        .tint(.red)
                    }

            }
            .navigationBarTitle("Home")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    Button(action: addButtonTapped) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            .confirmationDialog(
                "Delete 😱",
                isPresented: $isDeleteConfirmationDialogShown,
                titleVisibility: .visible,
                actions: {
                    Button("Yes", role: .destructive) {
                        withAnimation {
                            expenses.removeAll(where: { $0 == deleteConformationShownFor})
                        }
                    }
                    Button("No", role: .cancel) {

                    }
                },
                message: {
                    Text("Are you sure you want to delete this Item")
                }
            )
        }
    }

    func editSwipeActionTapped(for expense: Expense) {
        print("edit swipe action")

    }

    func deleteSwipeActionTapped(for expense: Expense) {
        deleteConformationShownFor = expense
        isDeleteConfirmationDialogShown = true
    }

    func addButtonTapped() {
        let item = Expense.mockItems.first!
        item.title = "New"
        item.id = .init()

        expenses.append(item)
    }
}

fileprivate extension Expense {
    static let mockItems: [Expense] = [
        .init(
            title: "Expenese 1",
            note: "Note One",
            amount: 1.25,
            category: "Fruits",
            date: .now
        ),
        .init(
            title: "Expenese 2",
            note: "Note Two",
            amount: 2.25,
            category: "Vegetables",
            date: .now
        )
    ]
}

private struct ExpenseItemView: View {
    let expense: Expense

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(expense.title)
                    .fontWeight(.bold)
                Spacer()
                if let category = expense.category {
                    Text(category)
                        .font(.callout)
                }
            }
            if let note = expense.note {
                Text(note)
            }
            HStack {
                Text(expense.amount, format: .currency(code: "Eur"))
                    .font(.title2)
                Spacer()
                Text(expense.date, style: .date)
                    .font(.callout)
            }
        }
    }
}

#Preview("ExpenseItemView", traits: .sizeThatFitsLayout) {
    ExpenseItemView(expense: Expense.mockItems.first!)
        .padding()
}

#Preview {
    HomeScreen()
}
