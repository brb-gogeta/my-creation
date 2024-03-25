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

class User: NSManagedObject {
    // ...
    
    func send(message: String, to recipient: User) {
        let context = recipient.managedObjectContext ?? self.managedObjectContext
        let newMessage = Message(context: context)
        newMessage.content = message
        newMessage.sender = self
        newMessage.recipient = recipient
        newMessage.timestamp = Date()
        
        self.addToMessages(newMessage)
        recipient.addToMessages(newMessage)
        
        saveContext()
    }
    
    func addFriend(_ friend: User) {
        self.addToFriends(friend)
        friend.addToFriends(self)
        saveContext()
    }
    
    func createGroup(name: String) {
        let context = self.managedObjectContext ?? persistentContainer.viewContext
        let group = Group(context: context)
        group.name = name
        self.addToGroups(group)
        
        saveContext()
    }
    
    // ...
}

class Message: NSManagedObject {
    // ...
}

class Group: NSManagedObject {
    // ...
    
    func addMember(_ member: User) {
        self.addToMembers(member)
        saveContext()
    }
    
    func createPost(content: String, author: User) {
        let context = author.managedObjectContext ?? self.managedObjectContext
        let post = Post(context: context)
        post.content = content
        post.author = author
        post.timestamp = Date()
        
        self.addToPosts(post)
        
        saveContext()
    }
    
    // ...
}

class Post: NSManagedObject {
    // ...
}

