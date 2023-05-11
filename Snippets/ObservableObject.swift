//
//  NetworkManager.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

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
