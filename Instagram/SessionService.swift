//
//  SessionService.swift
//  Instagram
//
//  Created by Abduraxmon Davurov on 25/01/26.
//

import Foundation

class SessionService {
    var isLogedIn = false
    
    func logIn() {
        isLogedIn.toggle()
    }
}
