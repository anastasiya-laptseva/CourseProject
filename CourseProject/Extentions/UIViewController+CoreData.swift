//
//  UIViewController+CoreData.swift
//  CourseProject
//
//  Created by Anastasiya Laptseva on 18.07.22.
//

import UIKit
import CoreData

extension UIViewController {
    private static let tableName = "SaveTable"
    private static let dateField = "dateField"
    private static let saveField = "saveField"
    
    func saveName(date: String, save: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let entity =  NSEntityDescription.entity(forEntityName: UIViewController.tableName, in: managedContext)
        let person = NSManagedObject(entity: entity!, insertInto: managedContext)
        person.setValue(date, forKey: UIViewController.dateField)
        person.setValue(save, forKey: UIViewController.saveField)
        do {
            try managedContext.save()
        } catch {
        }
    }
    func loadSave() -> [SaveTable] {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<SaveTable> = SaveTable.fetchRequest()
        do {
            let objects = try managedContext.fetch(fetchRequest)
            return objects.reversed()
        } catch {            
        }
        return [SaveTable]()
    }
}
