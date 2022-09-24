# Printer

A wrapper for OSLog.

### Required Boiler Plate

Copy and paste the following.

> Add exclusions if you want to disable print for certain logging domains, such as `.network`.

```swift
import Foundation
import Printer
import OSLog

@MainActor
struct Log {
    private static let identifier = try! BundleLocator.extractIdentifier()
    private static let manager = PrintManager(bundleIdentifier: identifier, exclude: [.network])
}

extension Log {

    /// Use .debug or .fault to log events here
    static let network: Logger = manager.network
        
    /// Use .info to log events here
    static let viewcycle: Logger = manager.viewcycle
}

final class BundleLocator {
    
    enum Error: Swift.Error {
        case notFound
    }
    
    static var bundle: Bundle {
        .main
//        Bundle(for: self)
    }
    
//    static func urlForResource(named name: String, extension fileExtension: String) throws -> URL {
//        guard let url = bundle.url(forResource: name, withExtension: fileExtension) else {
//            throw Error.notFound
//        }
//        return url
//    }
    
    static func extractIdentifier() throws -> String {
        guard let identifier = bundle.bundleIdentifier else {
            throw Error.notFound
        }
        return identifier
    }
}
```

### Usage

Example SwiftUI view body.

```
    var body: some View {
        Text("Hello")
          .onAppear {
              Log.viewcycle.info("\(MyView.self) did appear.")
          }
    }
```
