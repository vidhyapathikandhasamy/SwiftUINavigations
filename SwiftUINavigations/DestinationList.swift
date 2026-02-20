//
//  DestinationList.swift
//  SwiftUINavigations
//
//  Created by Vidhyapathi on 20/02/26.
//

import SwiftUI

struct Customer: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

struct DestinationDetails: View {
    let customer: Customer
    var body: some View {
        Text(customer.name)
    }
}

struct DestinationList: View {
    let customer: [Customer] = [Customer(name: "John"), Customer(name: "Peter"), Customer(name: "Pathi")]
    
    var body: some View {
        NavigationStack {
            List(customer) { customer in
                NavigationLink(customer.name, value: customer)
                    
            }
            .navigationDestination(for: Customer.self) { customer in
                DestinationDetails(customer: customer)
            }
        }
    }
}

#Preview {
    DestinationList()
}
