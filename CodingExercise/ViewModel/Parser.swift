//
//  Parser.swift
//  CodingExercise
//
//  Created by mav on 31/03/21.
//  Copyright © 2021 Rise Buildings. All rights reserved.
//

import Foundation


/*
 ViewModer parser structure to get the data from api and notify the view.
 */


struct Parser {
    
    func parse(complition: @escaping ([Contact]) -> ()) {
        let contant = ContantAPIClient()
        
        contant.getContacts { (data) in
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(ContactList.self, from:data)
                complition(result.contacts)
            }
            catch{
                print(error.localizedDescription)
            }
        }
    }
}
