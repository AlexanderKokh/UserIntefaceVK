//
//  UserProfile.swift
//  cloneVK
//
//  Created by Alexander Kokh on 11.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

struct friendInfo {
    var friendName:String
    var friendAvatar:UIImage
}

class UserFriends: UITableViewController {

  var friends = [friendInfo(friendName: "Хью Лори", friendAvatar: UIImage(named: "House")!),
                 friendInfo(friendName: "Вин Дизель",   friendAvatar: UIImage(named: "dizel")!),
                 friendInfo(friendName: "Джек Воробей", friendAvatar: UIImage(named: "Jack")!),
                 friendInfo(friendName: "Риана", friendAvatar: UIImage(named: "riana")!),
                 friendInfo(friendName: "Малыш", friendAvatar: UIImage(named: "kid")!)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "showFriendPage",
            let cell = sender as? UserCell,
            let destination = segue.destination as? FriendViewController {
            destination.friendImage = cell.friendImage.image
            destination.friendtitle = cell.friendNameLabel.text
        }
    }
        
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else { fatalError()}
        cell.friendNameLabel.text = friends[indexPath.row].friendName
        cell.friendImage.image = friends[indexPath.row].friendAvatar
            return cell
        }
    
    }
