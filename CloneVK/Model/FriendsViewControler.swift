//
//  FriendsViewControler.swift
//  cloneVK
//
//  Created by Alexander Kokh on 23.07.2020.
//  Copyright © 2020 Alexander Kokh. All rights reserved.
//

import UIKit

struct FriendData {
    
    var friends = [friendInfo(friendName: "Хью Лори", friendAvatar: UIImage(named: "House")!),
                   friendInfo(friendName: "Вин Дизель",   friendAvatar: UIImage(named: "dizel")!),
                   friendInfo(friendName: "Джек Воробей", friendAvatar: UIImage(named: "Jack")!),
                   friendInfo(friendName: "Риана", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Итан", friendAvatar: UIImage(named: "kid")!),
                   friendInfo(friendName: "Холмс", friendAvatar: UIImage(named: "House")!),
                   friendInfo(friendName: "Один",   friendAvatar: UIImage(named: "dizel")!),
                   friendInfo(friendName: "Леон", friendAvatar: UIImage(named: "Jack")!),
                   friendInfo(friendName: "Риана new", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Златан", friendAvatar: UIImage(named: "kid")!),
                   friendInfo(friendName: "Рузанна", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Малыш", friendAvatar: UIImage(named: "kid")!),
                   friendInfo(friendName: "Шерлок", friendAvatar: UIImage(named: "House")!),
                   friendInfo(friendName: "Вигго",   friendAvatar: UIImage(named: "dizel")!),
                   friendInfo(friendName: "Джек", friendAvatar: UIImage(named: "Jack")!),
                   friendInfo(friendName: "Сара", friendAvatar: UIImage(named: "riana")!),
                   friendInfo(friendName: "Йенифер", friendAvatar: UIImage(named: "kid")!)
    ]
    
    var sections: [Character: [String]] = [:]
    var sectionTitles: [Character] = []
   
    mutating func fillSections() -> Void {
        for friend in friends {
            let firstLetter = friend.friendName.first!
            if sections[firstLetter] != nil {
                sections[firstLetter]?.append(friend.friendName)
            }
            else {
                sections[firstLetter] = [friend.friendName]
            }
        }
        sectionTitles = Array(sections.keys)
        sectionTitles.sort()
    }
}

class TableFriendsViewController: UIViewController {
    
    var sections:[Character: [String]] = [:]
    var sectionTitles: [Character] = []
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.dataSource = self
        tableview.delegate = self
        
        var friendsData = FriendData()
        friendsData.fillSections()
        
        sections = friendsData.sections
        sectionTitles = friendsData.sectionTitles
    }
    
    @IBAction func SelectedRawUpdate(_ sender: Any) {
             var selday = (sender as! NameListPicker).selectedDay
             
             let numberOfSections = tableview.numberOfSections
             let numberOfRows = tableview.numberOfRows(inSection: numberOfSections-1)

             if numberOfRows > 0 {
                 guard let row = sectionTitles.firstIndex(of: selday!)else {return}
                 let indexPath = NSIndexPath(row: 0, section: row)
                 tableview.scrollToRow(at: indexPath as IndexPath, at: .top, animated: true)
             }
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
}

extension TableFriendsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[sectionTitles[section]]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
       return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(sectionTitles[section])
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as? UserCell else { fatalError()}
        
        guard let city = sections[sectionTitles[indexPath.section]]?[indexPath.row]
            else {
                fatalError()
        }
        cell.friendNameLabel.text = city
        cell.friendImage.image = UIImage(named: "House")!
        return cell
    }
}


extension TableFriendsViewController: UITableViewDelegate {
    
}
