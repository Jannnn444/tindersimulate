//
//  AuthenticationViewModel.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/2/3.
//

import Foundation

protocol AuthenticationViewModel {
    var formIsValid: Bool { get }
}

struct LoginViewModel: AuthenticationViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && 
        password?.isEmpty == false
    }
}

struct RegistrationViewModel: AuthenticationViewModel {
    var email: String?
    var fullname: String?
    var password: String?
    var formIsValid: Bool {
        return email?.isEmpty == false &&
        password?.isEmpty == false &&
        fullname?.isEmpty == false
    }
}
