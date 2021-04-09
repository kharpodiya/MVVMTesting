//
//  Contact.swift
//  CodingExercise
//
//  Created by mav on 31/03/21.
//  Copyright © 2021 Rise Buildings. All rights reserved.
//

import Foundation

// MARK: - ContactList Model

struct ContactList: Codable {
    let contacts : [Contact]
}

// MARK: - Contact Model

struct Contact: Codable {
    let firstName, lastName, tagHandle: String
    let imageURL: String

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case tagHandle = "tag_handle"
        case imageURL = "image_url"
    }
}
