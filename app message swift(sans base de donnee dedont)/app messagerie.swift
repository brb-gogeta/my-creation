import UIKit

struct User {
    var name: String
    var email: String
    var password: String
    var friends: [User]
    var groups: [Group]
    var messages: [Message]
    
    mutating func send(message: String, to recipient: User) {
        let newMessage = Message(content: message, sender: self, recipient: recipient)
        messages.append(newMessage)
        recipient.messages.append(newMessage)
    }
    
    mutating func addFriend(_ friend: User) {
        friends.append(friend)
        friend.friends.append(self)
    }
    
    mutating func createGroup(name: String) {
        let group = Group(name: name)
        groups.append(group)
    }
}

struct Message {
    var content: String
    var sender: User
    var recipient: User
    var timestamp: Date
}

struct Group {
    var name: String
    var members: [User]
    var posts: [Post]
    
    mutating func addMember(_ member: User) {
        members.append(member)
    }
    
    mutating func createPost(content: String, author: User) {
        let post = Post(content: content, author: author)
        posts.append(post)
    }
}

struct Post {
    var content: String
    var author: User
    var timestamp: Date
}

class MessengerAppViewController: UIViewController {
    var users: [User] = []
    var currentUser: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // ...
    }
    
    func login() {
        guard let username = loginTextField.text, let password = passwordTextField.text else {
            return
        }
        
        if let user = users.first(where: { $0.name == username && $0.password == password }) {
            currentUser = user
            displayNewsFeed()
        }
    }
    
    func createGroup() {
        guard let groupName = groupNameTextField.text else {
            return
        }
        
        if !groupName.isEmpty {
            currentUser?.createGroup(name: groupName)
            groupNameTextField.text = ""
            displayGroups()
        }
    }
    
    func sendMessage() {
        guard let messageContent = messageTextField.text, let selectedUser = usersTableView.indexPathForSelectedRow?.row else {
            return
        }
        
        let recipient = users[selectedUser]
        
        if !messageContent.isEmpty {
            currentUser?.send(message: messageContent, to: recipient)
            messagesTextView.text.append("\(currentUser!.name): \(messageContent)\n")
            messageTextField.text = ""
        }
    }
    
    func displayGroups() {
        // Update UI to display groups
        // ...
    }
    
    func displayNewsFeed() {
        // Update UI to display news feed
        // ...
    }
    
    // ...
}

