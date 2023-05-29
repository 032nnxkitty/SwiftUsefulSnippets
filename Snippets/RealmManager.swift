//
//  RealmManager.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import Foundation
import RealmSwift

final class RealmManager {
    static let shared = RealmManager()
    
    private var realmDataBase: Realm
    
    // MARK: - Private init
    private init() {
        do {
            try realmDataBase = Realm()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    // MARK: - Public Methods
    func fetchAll<T: Object>() -> Results<T> {
        return realmDataBase.objects(T.self)
    }
    
    func fetchAll<T: Object>(sortedBy keyPath: String, ascending: Bool) -> Results<T> {
        return realmDataBase.objects(T.self).sorted(byKeyPath: keyPath, ascending: ascending)
    }
    
    func save<T: Object>(object: T, errorHandler: @escaping (Error) -> Void = { _ in return } ) {
        do {
            try realmDataBase.write {
                realmDataBase.add(object)
            }
        } catch {
            errorHandler(error)
        }
    }
    
    func update<T: Object>(object: T, errorHandler: @escaping (Error) -> Void = { _ in return } ) {
        do {
            try realmDataBase.write {
                realmDataBase.add(object, update: .all)
            }
        } catch {
            errorHandler(error)
        }
    }
    
    func delete<T: Object>(object: T, errorHandler: @escaping (Error) -> Void = { _ in return } ) {
        do {
            try realmDataBase.write {
                realmDataBase.delete(object)
            }
        } catch {
            errorHandler(error)
        }
    }
    
    func deleteAll(errorHandler: @escaping ((_ error : Swift.Error) -> Void) = { _ in return }) {
        do {
            try realmDataBase.write {
                realmDataBase.deleteAll()
            }
        } catch {
            errorHandler(error)
        }
    }
}

