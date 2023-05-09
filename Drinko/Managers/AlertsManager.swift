//
//  AlertsManager.swift
//  Drinko
//
//  Created by Arthur Obichkin on 23/04/23.
//

import UIKit


struct AlertManager{
    static func createErrorAlert(title:String?,message:String?,_ completion: @escaping (UIAlertController) -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Cancel", style: .cancel)
        alert.addAction(action)
        completion(alert);
    }
    static func createConfirmAlert(title:String?,message:String?, onconfirm:@escaping () -> Void,_ completion: @escaping (UIAlertController) -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Yes", style: .destructive) {_ in
            onconfirm()
        }
        let cancelAction = UIAlertAction(title: "No", style: .cancel)
        alert.addAction(confirmAction)
        alert.addAction(cancelAction)
        completion(alert);
    }
}
