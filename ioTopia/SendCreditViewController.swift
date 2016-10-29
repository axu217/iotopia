//
//  SendCreditViewController.swift
//  ioTopia
//
//  Created by AXE07 on 10/16/16.
//  Copyright © 2016 ZheChengXu. All rights reserved.
//

import UIKit

class SendCreditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var userList: UserBase = UserBase();
    let networkManager: NetworkManager = (UIApplication.shared.delegate as! AppDelegate).networkManager
    
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        getUserList() { result, error in
            self.userList = result
            self.do_table_refresh()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userList.getList().count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! SendCreditTableCell
        let number = indexPath.row
        cell.id = userList.getList()[number].getID()
        
        cell.name.text = userList.getList()[number].getUsername()
        return cell
    }
    
    func getUserList(completionHandler: @escaping (UserBase, NSError?) -> ()){
        networkManager.getUsers(completionHandler: completionHandler)
    }
    
    func do_table_refresh()
    {
        DispatchQueue.main.async( execute: {
            self.tableView.reloadData();
        })
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let temp = (tableView.cellForRow(at: indexPath) as! SendCreditTableCell).id
        performFakeSegue(id: temp)
        
    }
    
    func performFakeSegue(id: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        let viewController = storyboard.instantiateViewController(withIdentifier: "SendCreditFinalViewController")
        
        addChildViewController(viewController)
        
        view.addSubview(viewController.view)
        
        viewController.view.frame = view.bounds
        viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        viewController.didMove(toParentViewController: self)

        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier! == "sendCreditToProceed"){
            let destinationVC = segue.destination as! SendCreditFinalViewController
            destinationVC.id = sender! as! Int
        }
    }
    
    
}
