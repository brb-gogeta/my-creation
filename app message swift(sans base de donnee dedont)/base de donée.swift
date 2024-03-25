import UIKit
import CoreData

class MessengerAppViewController: UIViewController {
    // Déclaration du Persistent Container pour Core Data
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "MessengerAppModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Erreur lors du chargement du Persistent Store : \(error)")
            }
        }
        return container
    }()
    
    // ...

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                fatalError("Erreur lors de la sauvegarde du contexte : \(error)")
            }
        }
    }
    
    func createUser(name: String, email: String, password: String) {
        let context = persistentContainer.viewContext
        let user = User(context: context)
        user.name = name
        user.email = email
        user.password = password
        saveContext()
    }
    
    func fetchUserByName(name: String) -> User? {
        let context = persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)
        do {
            let users = try context.fetch(fetchRequest)
            return users.first
        } catch {
            fatalError("Erreur lors de la récupération des utilisateurs : \(error)")
        }
    }
    
    // ...
}
