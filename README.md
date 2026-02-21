# SwiftUINavigations

> A hands-on reference project demonstrating every major navigation pattern in SwiftUI — from basic `NavigationLink` to fully programmatic stack control.

![Swift](https://img.shields.io/badge/Swift-5.9-FA7343?logo=swift&logoColor=white)
![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-0070C9?logo=apple&logoColor=white)
![iOS](https://img.shields.io/badge/iOS-16%2B-000000?logo=apple&logoColor=white)
![Xcode](https://img.shields.io/badge/Xcode-15%2B-147EFB?logo=xcode&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-green)

---

## Overview

This project walks through four distinct SwiftUI navigation techniques, each isolated in its own file for clarity. Whether you're new to `NavigationStack` or looking for a clean reference on type-safe routing and programmatic path control, this repo covers it all.

---

## File Structure

```
SwiftUINavigations/
│
├── SwiftUINavigations.xcodeproj/       # Xcode project configuration
│   └── project.pbxproj
│
├── SwiftUINavigations/                 # Main app source
│   ├── SwiftUINavigationsApp.swift     # App entry point (@main)
│   │
│   ├── ContentView.swift               # 01 · Basic NavigationStack & NavigationLink
│   ├── NavigationValueDestination.swift # 02 · Type-safe navigation with value + navigationDestination
│   ├── DestinationList.swift           # 03 · List-based navigation with Identifiable model
│   └── ProgramaticNavigation.swift     # 04 · Programmatic navigation via @State path
│   │
│   └── Assets.xcassets/               # App icons, accent color
│       ├── AppIcon.appiconset/
│       └── AccentColor.colorset/
│
├── SwiftUINavigationsTests/            # Unit tests
│   └── SwiftUINavigationsTests.swift
│
├── SwiftUINavigationsUITests/          # UI tests
│   ├── SwiftUINavigationsUITests.swift
│   └── SwiftUINavigationsUITestsLaunchTests.swift
│
└── README.md
```

---

## Navigation Patterns Covered

### 01 · Basic Navigation — `ContentView.swift`

The simplest way to use `NavigationStack` with `NavigationLink`. Two link styles are shown: a title-only shorthand and a fully custom label.

```swift
NavigationStack {
    NavigationLink("Navigation Title") {
        DetailView()
    }

    NavigationLink {
        DetailView()
    } label: {
        Text("Go to Detail")
    }
}
```

**Key concepts:**
- `NavigationStack` — replaces the deprecated `NavigationView`
- `NavigationLink` with inline destination
- Custom label via trailing closure

---

### 02 · Type-Safe Navigation with Values — `NavigationValueDestination.swift`

Uses `NavigationLink(value:)` paired with `.navigationDestination(for:)` to route to different views based on the type of the passed value. This pattern is type-safe and scales cleanly to complex apps.

```swift
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
```

**Key concepts:**
- `NavigationLink(_, value:)` — decouples the link from its destination
- `.navigationDestination(for:)` — registered once, handles all links of a given type
- Multiple destinations registered for different types (`Int`, `String`)

---

### 03 · List-Based Navigation — `DestinationList.swift`

Demonstrates navigating from a `List` of model objects. The `Customer` model conforms to both `Identifiable` and `Hashable`, which is required for use as a navigation value.

```swift
struct Customer: Identifiable, Hashable {
    let id = UUID()
    var name: String
}

NavigationStack {
    List(customer) { customer in
        NavigationLink(customer.name, value: customer)
    }
    .navigationDestination(for: Customer.self) { customer in
        DestinationDetails(customer: customer)
    }
}
```

**Key concepts:**
- Model conforming to `Identifiable` + `Hashable` for navigation value support
- `List` + `NavigationLink` — standard master-detail pattern
- Single `.navigationDestination` handles all list-row taps

---

### 04 · Programmatic Navigation — `ProgramaticNavigation.swift`

Takes full control of the navigation stack by binding it to a `@State` array. Pushing to the array pushes a new screen; removing from it pops. This is the foundation for deep-linking, onboarding flows, and auth redirects.

```swift
struct ProgramaticNavigation: View {
    @State private var numbers: [Int] = [1, 2, 3, 4]

    var body: some View {
        NavigationStack(path: $numbers) {
            VStack {
                Button("Navigation") {
                    numbers.append(1)     // programmatically push
                }
                .navigationDestination(for: Int.self) { value in
                    Text("\(value)")
                }
            }
        }
    }
}
```

**Key concepts:**
- `NavigationStack(path:)` — binds the stack to an external state array
- `@State var path: [Type]` — each element in the array = one pushed screen
- `path.append(value)` — push | `path.removeLast()` — pop | `path = []` — pop to root
- Foundation for deep linking and conditional navigation

---

## Quick Comparison

| Pattern | File | Use When |
|---|---|---|
| Basic `NavigationLink` | `ContentView.swift` | Simple one-off navigation |
| Value + Destination | `NavigationValueDestination.swift` | Type-safe routing to typed destinations |
| List navigation | `DestinationList.swift` | Master-detail list with model objects |
| Programmatic path | `ProgramaticNavigation.swift` | Deep links, auth flows, complex routing |

---

## Requirements

| Tool | Version |
|---|---|
| Xcode | 15.0+ |
| iOS Deployment Target | 16.0+ |
| Swift | 5.9+ |
| SwiftUI | 5.0+ |

---

## Getting Started

```bash
# Clone the repository
git clone https://github.com/vidhyapathikandhasamy/SwiftUINavigations.git

# Open in Xcode
cd SwiftUINavigations
open SwiftUINavigations.xcodeproj
```

Then select a simulator or device and press **⌘R** to run.

To explore a specific pattern, open the corresponding file and set it as the root view in `SwiftUINavigationsApp.swift`:

```swift
@main
struct SwiftUINavigationsApp: App {
    var body: some Scene {
        WindowGroup {
            ProgramaticNavigation()  // swap to any view
        }
    }
}
```

---

## Author

**Vidhyapathi Kandhasamy** — Senior iOS Developer with 8+ years of experience building production Swift apps.

[![LinkedIn](https://img.shields.io/badge/LinkedIn-vidhyapathi-0077B5?logo=linkedin)](https://www.linkedin.com/in/vidhyapathi/)
[![GitHub](https://img.shields.io/badge/GitHub-vidhyapathikandhasamy-181717?logo=github)](https://github.com/vidhyapathikandhasamy)

---

## License

This project is available under the MIT License. Feel free to use it as a reference or learning resource.
