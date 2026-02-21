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



struct ProgramaticNavigation: View {
    
    @EnvironmentObject private var navigationStore: NavigationStore
    
    var body: some View {
            VStack {
                Button("Home") {
                    navigationStore.route.append(.home)
                }
                Button("Details") {
                    navigationStore.route.append(.detail(CustomerDetails(name: "Vidhyapathi")))
                }
                
            }
        
    }
}

#Preview {
    NavigationStack {
        ProgramaticNavigation()
            .environmentObject(NavigationStore())
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
