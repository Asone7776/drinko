//
//  SignInViewViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 15/04/23.
//

import UIKit
import FirebaseAuth

final class SignInViewViewModel: NSObject{
    override init(){
        super.init()
    }
    
    public func signInUser(email:String?, password:String?,_ completion: @escaping (Result<AuthDataResult,Error>) -> Void){
        if let email = email,let password = password{
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                guard let data = authResult else{
                    return
                }
                if let error = error{
                    completion(.failure(error))
                }
                completion(.success(data))
            }
        }
    }
}


extension SignInViewViewModel: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.endEditing(true);
        return true;
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
//        if textField.text != ""{
//            return true;
//        }else{
//            return false;
//        }
    }
}
