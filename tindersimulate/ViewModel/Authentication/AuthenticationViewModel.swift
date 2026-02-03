//
//  AuthenticationViewModel.swift
//  tindersimulate
//
//  Created by Hualiteq International on 2026/2/3.
//

import Foundation

struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

struct RegistrationViewModelb {
    
}
