//
//  File.swift
//  EncodableDecodable
//
//  Created by sivakumar on 11/12/18.
//  Copyright © 2018 sivakumar. All rights reserved.
//

import Foundation

struct User : Decodable{
    
    let company: [String : String]
    let email: String
    let name: String
    let phone: String
    let username: String
    let id: Int
    let address: Address
}


//{
//    "street": "Kulas Light",
//    "suite": "Apt. 556",
//    "city": "Gwenborough",
//    "zipcode": "92998-3874",
//    "geo": {
//        "lat": "-37.3159",
//        "lng": "81.1496"
//}

struct Address: Decodable{
    let street: String
    let suite: String
    let city: String
    let zipcode: String
}
