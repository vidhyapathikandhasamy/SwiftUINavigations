//
//  ProgramaticNavigation.swift
//  SwiftUINavigations
//
//  Created by Vidhyapathi on 21/02/26.
//

import SwiftUI

struct CustomerDetails: Identifiable, Hashable {
    let name: String
    let id: UUID = UUID()
}

enum Route: Hashable {
    case home
    case detail(CustomerDetails)
}

struct ProgramaticNavigation: View {
    
    @State private var routes: [Route] = []
    
    var body: some View {
        NavigationStack(path: $routes) {
            VStack {
                Button("Home") {
                    routes.append(.home)
                }
                Button("Details") {
                    routes.append(.detail(CustomerDetails(name: "Vidhyapathi")))
                }
                .navigationDestination(for: Route.self) { route in
                    switch route {
                    case .home:
                        Text("Home")
                    case .detail(let customer):
                        Text(customer.name)
                    }
                }
            }
        }
    }
}

#Preview {
    ProgramaticNavigation()
}
