//
//  En2CzDictionaryViewController.swift
//  dictionary
//
//  Created by Michal Duda on 02/06/2019.
//  Copyright © 2019 Michal Duda. All rights reserved.
//

import UIKit

class Original2TranslationDictionaryViewController: BaseDictionaryViewController {
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let populate = DictionaryRecordLoader(db: Bundle.main.path(forResource: RuntimeSettings.dictionaryDatabase, ofType: "db")!)
        records = populate.populate(table: RuntimeSettings.databaseOriginal2TranslationTable)
        filteredRecords = records
    }
    
    override func reloadTableViewData() {
        tableView.reloadData();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "detail":
            if let consumer = segue.destination as? DictionaryRecordConsumer {
                if let indexPath = tableView.indexPathForSelectedRow {
                    consumer.consume(record: filteredRecords[indexPath.row])
                }
            }
        case "info":
            break
        default:
            debugPrint("unknown segue", segue.identifier ?? "nil")
        }
    }
}
