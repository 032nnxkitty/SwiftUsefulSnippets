//
//  InternetConnectionObserver.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import Network

protocol InternetConnectionObserver {
    var isReachable: Bool { get }
    func startMonitoring()
    func stopMonitoring()
}

final class InternetConnectionObserverImp: InternetConnectionObserver {
    private let monitor: NWPathMonitor
    private var status: NWPath.Status
    
    init() {
        self.monitor = NWPathMonitor()
        self.status = .requiresConnection
    }
    
    var isReachable: Bool {
        return status == .satisfied
    }
    
    func startMonitoring() {
        monitor.pathUpdateHandler = { [weak self] path in
            self?.status = path.status
            
            if path.status == .satisfied {
                // do something
            } else {
                // do something
            }
        }
        
        let queue = DispatchQueue(label: "NetworkMonitor")
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
