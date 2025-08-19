//
//  DBHelper.swift
//  Reminder
//
//  Created by João Vitor on 19/08/25.
//

import Foundation
import SQLite3

class DBHelper {
    static let shared = DBHelper()
    private var db: OpaquePointer?
    let dbPath = FileManager.default
        .urls(for: .documentDirectory, in: .userDomainMask)
        .first!
        .appendingPathComponent("Reminder.sqlite")
    
    private init() {
        openDatabase()
        createTable()
    }
    
    private func openDatabase() {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent("Reminder.sqlite")
        
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Erro ao abrir o banco de dados")
        }
    }
    
    private func createTable() {
        let createTableQuery = """
            CREATE TABLE IF NOT EXISTS Receipts (
                ID INTEGER PRIMARY KEY AUTOINCREMENT,
                remedy TEXT,
                time TEXT,
                recurrence TEXT,
                takeNow INTEGER
            );
            """
        // _clients    NSMutableString    "file:///Users/joaovitor/Library/Developer/CoreSimulator/Devices/8F139737-C39B-4D2C-AAC5-E31832276A7F/data/Containers/Data/Application/D2E49201-F4FA-450D-A9C3-2A711CA94749/Documents/Reminder.sqlite"    0x0000600003b049a0
        var statement: OpaquePointer?
        if sqlite3_prepare_v2(db, createTableQuery, -1, &statement, nil) == SQLITE_OK {
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Tabela criada com sucesso")
            } else {
                print("Erro ao criar tabela")
            }
        } else {
            print("CreateTable statement não conseguiu executar")
        }
        
        sqlite3_finalize(statement)
    }
    
    func insertReceipt(remedy: String, time: String, recurrence: String, takeNow: Bool) {
        let insertQuery = "INSERT INTO Receipts (remedy, time, recurrence, takeNow) VALUES (?, ?, ?, ?);"
        var statement: OpaquePointer?
        
        if sqlite3_prepare_v2(db, insertQuery, -1, &statement, nil) == SQLITE_OK {
            sqlite3_bind_text(statement, 1, (remedy as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (time as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (recurrence as NSString).utf8String, -1, nil)
            sqlite3_bind_int(statement, 4, (takeNow ? 1 : 0))
            
            if sqlite3_step(statement) == SQLITE_DONE {
                print("Receita criada com sucesso")
            } else {
                print("Falha ao criar receita")
            }
        } else {
            print("INSERT statement falhou")
        }
        
        sqlite3_finalize(statement)
    }
}
