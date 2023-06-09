# Useful code snippets
Here are examples of the contents of this repository:

#### Internet Connection Observer:
```swift
import Network

protocol InternetConnectionObserver {
    var isReachable: Bool { get }
    func startMonitoring()
    func stopMonitoring()
}

class InternetConnectionObserverImp: InternetConnectionObserver {
    private let monitor = NWPathMonitor()
    private var status: NWPath.Status = .requiresConnection
    private let lock = NSLock()
    
    var isReachable: Bool {
        lock.lock()
        defer {
            lock.unlock()
        }
        return status == .satisfied
    }
    
    private init() {
        startMonitoring()
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
        }
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
```

#### MVVM Bindings
```swift
class ObservableObject<T> {
    typealias Listener = (T) -> Void
    
    private var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(value: T) {
        self.value = value
    }
    
    func bind(listener: @escaping Listener) {
        self.listener = listener
    }
}

```

#### UINavigationBarLargeTitleView
```swift
override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    guard let UINavigationBarLargeTitleView = NSClassFromString("_UINavigationBarLargeTitleView") else { return }
        navigationController?.navigationBar.subviews.forEach { barSubview in
            if barSubview.isKind(of: UINavigationBarLargeTitleView.self) {
                // do something with this view
            }
        }
    }
}
```

And other :)
