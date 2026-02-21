//
//  SwiftUINavigationsApp.swift
//  SwiftUINavigations
//
//  Created by Vidhyapathi on 20/02/26.
//

import SwiftUI
import Combine

enum Route: Hashable {
    case home
    case detail(CustomerDetails)
}

class NavigationStore: ObservableObject {
    @Published var route: [Route] = []
}

@main
struct SwiftUINavigationsApp: App {
    
    @StateObject var navigationStore = NavigationStore()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navigationStore.route) {
                ProgramaticNavigation()
                    .environmentObject(navigationStore)
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
