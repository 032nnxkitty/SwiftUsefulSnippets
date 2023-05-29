//
//  InternetConnectionObserver.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import Network
import Foundation

protocol InternetConnectionObserver {
    var isReachable: Bool { get }
    func startMonitoring()
    func stopMonitoring()
}

final class InternetConnectionObserverImp: InternetConnectionObserver {
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
