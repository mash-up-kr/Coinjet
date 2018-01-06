//
//  CoreDataStack.swift
//  Coin Widget
//
//  Created by Daeyun Ethan Kim on 06/01/2018.
//  Copyright © 2018 Daeyun Ethan Kim. All rights reserved.
//

import CoreData

// MARK: - CoreDataStack
class CoreDataStack {
    static let shared = CoreDataStack()
    
    // MARK: Properties
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Widget")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Error: CoreDataStack - persistentContainer \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private var context: NSManagedObjectContext { return persistentContainer.viewContext }
    
    // MARK: Functions
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nsError = error as NSError
                fatalError("Error: CoreDataStack - saveContext \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    func deleteContext(object: NSManagedObject) {
        context.delete(object)
    }
    
    func getObject(request: NSFetchRequest<NSManagedObject>) -> [Any] {
        do {
            return try context.fetch(request)
        } catch {
            return []
        }
    }
}
