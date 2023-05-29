//
//  CoreDataManager.swift
//  Swift Snippets
//
//  github.com/032nnxkitty
//

import CoreData

final class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    private var entityName: String {
        return String(describing: <#Entity model name#>.self)
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: <#.xcdatamodeldf file name#>)
        container.loadPersistentStores { _, error in
            if let error {
                fatalError(error.localizedDescription)
            }
        }
        return container
    }()
    
    private lazy var viewContext: NSManagedObjectContext = {
        return persistentContainer.viewContext
    }()
    
    private func saveContext(backgroundContext: NSManagedObjectContext? = nil) {
        let context = backgroundContext ?? viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch let error as NSError {
            print("Error: \(error), \(error.userInfo)")
        }
    }
}
