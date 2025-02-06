//
//  ContentView.swift
//  iExpense
//
//  Created by Андрей Завадский on 04.02.2025.
//

import SwiftUI

@Observable
class User {
    var firstName = "Bilbo"
    var lastName = "Baggins"
}

struct ContentView: View {
    @State private var user = User()

       var body: some View {
           VStack {
               Text("Your name is \(user.firstName) \(user.lastName).")

               TextField("First name", text: $user.firstName)
               TextField("Last name", text: $user.lastName)
           }
       }
   }

#Preview {
    ContentView()
}
