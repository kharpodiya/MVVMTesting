//
//  ViewController.swift
//  CodingExercise
//
//  Created by Bigstep Technologies on 6/8/20.
//  Copyright © 2020 Bigstep Technologies. All rights reserved.
//

import UIKit
import SDWebImage

class ContactListViewController: UIViewController {
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()

    let parser = Parser()
    var contacts = [Contact?]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // getting data from ViewModel
        parser.parse {
            data in
            
            self.contacts = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
        addTableView()

    }

    
    //Adding and Config contact table view
    
    func addTableView() {
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ContactTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTableViewcell")
        self.view.addSubview(tableView)
        tableView.reloadData()
    }
}


//MARK:- Contact TableView Delegate and DataSoource

extension ContactListViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTableViewcell", for: indexPath) as! ContactTableViewcell
        
        if let name = contacts[indexPath.row]?.firstName{
            if let lastname = contacts[indexPath.row]?.lastName{
                cell.contactNameLabel.text = "\(name) \(lastname)"
            }
            else{
                cell.contactNameLabel.text = name
            }
        }
        else{
            cell.contactNameLabel.text = ""
        }
        if let tag = contacts[indexPath.row]?.tagHandle{
            cell.contactTagLabel.text = tag
        }
        else{
            cell.contactTagLabel.text = ""
        }
        /*
         used sdwebimage from download and cached the image from url.
         */
        if let url = contacts[indexPath.row]?.imageURL{
            cell.contactAvatarImage?.sd_setImage(with: URL(string: url), placeholderImage: #imageLiteral(resourceName: "Image"), options: .waitStoreCache, context: nil)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
    
}
