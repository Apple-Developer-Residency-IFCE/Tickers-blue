//
//  HomeViewModel.swift
//  Tickers
//
//  Created by Caio de Almeida Pessoa on 16/06/23.
//

import SwiftUI
import CoreData

class TickerViewModel: ObservableObject {
    let viewContext = DataController.shared.container.viewContext
    static var shared = TickerViewModel()
    
    var tickerData: [TickerDB] = []
    
    private let tickerLevelXP: [Int:[Int]] = [1:[20, 45], 2:[75, 120], 3:[180, 285], 4:[360, 485], 5:[630, 810], 6:[1020, 1170]]
    
    private init(){
        fetch()
        data = tickerData.isEmpty ?  [
            Ticker(id: UUID(), title: "NoName", xp: 0, EggImg: "blueEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: UUID(), title: "NoName", xp: 0, EggImg: "redEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: UUID(), title: "NoName", xp: 0, EggImg: "greenEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: UUID(), title: "NoName", xp: 0, EggImg: "yellowEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: UUID(), title: "NoName", xp: 0, EggImg: "pinkEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: UUID(), title: "NoName", xp: 0, EggImg: "blueEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false)
        ] : [
            Ticker(id: tickerData[0].id ?? UUID(), title: "NoName", xp: 0, EggImg: "blueEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: tickerData[1].id ?? UUID(), title: "NoName", xp: 0, EggImg: "redEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: tickerData[2].id ?? UUID(), title: "NoName", xp: 0, EggImg: "greenEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: tickerData[3].id ?? UUID(), title: "NoName", xp: 0, EggImg: "yellowEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: tickerData[4].id ?? UUID(), title: "NoName", xp: 0, EggImg: "pinkEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false),
            Ticker(id: tickerData[5].id ?? UUID(), title: "NoName", xp: 0, EggImg: "blueEgg", TickerImg: "BabyCat", level: 0, maxProgress: 999, actualProgress: 0, locked: true, isSelected: false)
        ]
        startAplication()
        updateData()
    }
    
    func startAplication(){
        if (tickerData.isEmpty){
            data.forEach { ticker in
                self.createTicker(name: ticker.title, uuid: ticker.id)
            }
        }
    }
    
    func fetch() {
        let fetchRequest: NSFetchRequest<TickerDB> = TickerDB.fetchRequest()
        
        guard let fetchData = try? viewContext.fetch(fetchRequest) else {
            return
        }
        
        tickerData = fetchData
    }
    
    func save() {
        do {
            try viewContext.save()
            fetch()
        } catch let error as NSError {
            print("could not save \(error) \(error.userInfo)")
        }
    }
    
    func createTicker(name:String, uuid: UUID) {
        let newTicker = TickerDB(context: viewContext)

        newTicker.id = uuid
        newTicker.name = name
        newTicker.xp = 0
        newTicker.isSelected = false
        
        save()
    }
    
    func updateTicker(id: UUID, name: String, xp: Int16, isSelected: Bool) {
        tickerData.first(where: { $0.id == id})!.name = name
        tickerData.first(where: { $0.id == id})!.xp = xp
        tickerData.first(where: { $0.id == id})!.isSelected = isSelected
    
        save()
        updateData()
    }
    
    func updateData() {
        for i in 0..<tickerData.count {
            data[i].title = tickerData[i].name ?? "noName"
            data[i].xp = tickerData[i].xp
            data[i].isSelected = tickerData[i].isSelected
            
            
            if data[i].xp >= data[i].maxProgress {
                if data[i].level < 2{
                    data[i].locked = false
                    data[i].level += 1
                    data[i].maxProgress = tickerLevelXP[i+1]![1]
                    data[i].actualProgress = min(data[i].maxProgress ,Int(tickerData[i].xp) - tickerLevelXP[i+1]![0])
                }
            } else {
                data[i].maxProgress = tickerLevelXP[i+1]![0]
                data[i].actualProgress = Int(tickerData[i].xp)
            }
        }
        
        save()
    }
    
    func selectTicker(id: UUID) {
        for i in 0..<tickerData.count {
            tickerData[i].isSelected = false
        }
        
        let ticker = tickerData.first(where: { $0.id == id})!
        
        updateTicker(id: id, name: ticker.name!, xp: ticker.xp, isSelected: true)
    }
    
    func addEXP(xp: Int16) {
        let ticker = tickerData.first(where: { $0.isSelected })!
        
        updateTicker(id: ticker.id!, name: ticker.name!, xp: ticker.xp + xp, isSelected: ticker.isSelected)
    }
    
    @Published var data: [Ticker] = []
    
    @Published var name = "Caio"
}
