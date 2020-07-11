//
//  Groups.swift
//  cloneVK
//
//  Created by Alexander Kokh on 11.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

struct groupInfo {
    var groupName: String
    var groupImage: UIImage
}

class GroupController: UITableViewController {
    
    var groups =  [groupInfo(groupName: "IOS developers", groupImage: UIImage(named: "IOS developers")!),
                   groupInfo(groupName: "IOS magic", groupImage: UIImage(named: "IOS magic")!),
                   groupInfo(groupName: "SWIFT UI", groupImage: UIImage(named:"swiftUI")!),
                   groupInfo(groupName: "Hack with swift", groupImage: UIImage(named:"Hack with swift")!),
                   groupInfo(groupName: "Swift for 40 days", groupImage: UIImage(named:"Swift for 40 days")!),
                   groupInfo(groupName: "Films", groupImage: UIImage(named:"films")!),
                   groupInfo(groupName: "New films", groupImage: UIImage(named:"best")!),
                   groupInfo(groupName: "Cars", groupImage:  UIImage(named:"car")!),
                   groupInfo(groupName: "Swift", groupImage: UIImage(named:"swift")!),
                   groupInfo(groupName: "How to become a senior", groupImage: UIImage(named:"senior")!),
                   groupInfo(groupName: "Best films", groupImage: UIImage(named:"Best films")!),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell") as? GroupCell else {fatalError()}
        cell.groupNameLabel.text = groups[indexPath.row].groupName
        cell.groupImage.image = groups[indexPath.row].groupImage
     return cell
    }
}
