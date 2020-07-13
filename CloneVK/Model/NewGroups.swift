//
//  NewGroups.swift
//  cloneVK
//
//  Created by Alexander Kokh on 13.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit


class NewGroups:UITableViewController {
    
    
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
    
    var groupsscreen =  [groupInfo?]()
    
    var newgGoupsScreen =  [groupInfo?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var itsEqual: Bool
        
         guard let cell = tableView.dequeueReusableCell(withIdentifier: "allGroupCell") as? AllGroupCell else {fatalError()}
        for elementGroup in groups {
            itsEqual = false
            for elementUserGroups in groupsscreen {
                guard elementUserGroups?.groupName == elementGroup.groupName  else {continue}
                   itsEqual = true
            }
            if !itsEqual {
                newgGoupsScreen.append(groupInfo(groupName: elementGroup.groupName,groupImage: elementGroup.groupImage))
            }
        }
        
        cell.newGroupNameLabel.text = newgGoupsScreen[indexPath.row]?.groupName
        cell.newGroupImage.image = newgGoupsScreen[indexPath.row]?.groupImage
      return cell
     }
    

    
}
