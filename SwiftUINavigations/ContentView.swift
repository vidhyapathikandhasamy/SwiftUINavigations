//
//  ContentView.swift
//  SwiftUINavigations
//
//  Created by Vidhyapathi on 20/02/26.
//

import SwiftUI

struct DetailView: View {
    var body: some View {
        Text("Detail View")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Spacer()
            NavigationLink("Navigation Title") {
                DetailView()
            }
            Spacer()
            NavigationLink {
                DetailView()
            } label: {
                Text("Go to Detail")
            }
            Spacer()
        }
    }
}

#Preview {
    ContentView()
}
