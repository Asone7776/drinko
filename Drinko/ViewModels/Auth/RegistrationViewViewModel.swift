//
//  RegistrationViewModel.swift
//  Drinko
//
//  Created by Arthur Obichkin on 23/04/23.
//

import UIKit
import FirebaseAuth

final class RegistrationViewViewModel: NSObject{
    override init(){
        super.init()
    }
    
    public func registerUser(email:String?, password:String?,_ completion: @escaping (Result<AuthDataResult,Error>) -> Void){
        if let email = email,let password = password{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                guard let data = authResult, error == nil else{
                    if let error = error{
                        completion(.failure(error))
                    }
                    return
                }
                completion(.success(data))
            }
        }
    }
}


extension RegistrationViewViewModel: UITextFieldDelegate{
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
