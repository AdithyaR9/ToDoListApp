//
//  ToDoListItemsView.swift
//  ToDoList
//
//  Created by Adithya Ramanathan on 3/13/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ToDoListView: View {
    
    @StateObject var viewModel: ToDoListViewViewModel
    @FirestoreQuery var items: [ToDoListItem]   //query that will continuously listen for items
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        // todos entries live at users/<id>/todos/<entries>
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ToDoListItemView(item: item)
                        .swipeActions {     // do be able to swipe to delete todo items
                            Button("Delete") {
                                // to delete
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
            }
            .navigationTitle("To Do List")  // title for this tab
            .toolbar {      // to make plus button at top to add more todos
                Button {
                    // action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {    // depending on if showwingnewitemveiw var is true or false
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoListView(userId: "QhleLcTrHiNIf4XXngRQfwqZfKZ2")
}
