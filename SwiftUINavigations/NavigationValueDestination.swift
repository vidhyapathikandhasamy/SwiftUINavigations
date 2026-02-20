//
//  NavigationValueDestination.swift
//  SwiftUINavigations
//
//  Created by Vidhyapathi on 20/02/26.
//
import SwiftUI

struct NavigationDetailView: View {
    let value: Int
    var body: some View {
        Text("The Passed Number \(value)")
    }
}
struct CustomerView: View {
    let value: String
    var body: some View {
        Text("Hi \(value)")
    }
}

struct NavigationValueDestination: View {
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Destination View", value: 99)
                    
                
                NavigationLink("Customer View", value: "Pathi")
            }
            .navigationDestination(for: Int.self) { value in
                NavigationDetailView(value: value)
            }
            .navigationDestination(for: String.self) { value in
                CustomerView(value: value)
            }
            
        }
    }
}


#Preview {
    NavigationValueDestination()
}
