//
//  ViewController.swift
//  DMegase
//
//  Created by Luis Henrique de Oliveira Amorim on 5/5/18.
//  Copyright © 2018 Luis Henrique de Oliveira Amorim. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController {

    @IBOutlet weak var myWevView: WebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Bundle.main.url(forResource: "D_MEGA", withExtension: "HTM", subdirectory: "D_megase")
        let urlRequest = URLRequest(url: url!)
        myWevView.mainFrame.load(urlRequest)
        
    }

    @IBAction func chagePage(_ sender: Any) {
        
        
        let documentDOM = myWevView.mainFrameDocument
        if let table = documentDOM?.getElementsByTagName("table") {
            let tablehtml:DOMHTMLTableElement = table.item(0) as! DOMHTMLTableElement
            var arr:[Mega] = [Mega]()
            for i in 1..<tablehtml.rows.length {
                let row2 = tablehtml.rows.item(UInt32(i)) as! DOMHTMLTableRowElement
                if row2.cells.length == 21 {
                    let concurso = row2.cells.item(0).textContent!
                    let data = row2.cells.item(1).textContent ?? ""
                    let d1 = row2.cells.item(2).textContent ?? ""
                    let d2 = row2.cells.item(3).textContent ?? ""
                    let d3 = row2.cells.item(4).textContent ?? ""
                    let d4 = row2.cells.item(5).textContent ?? ""
                    let d5 = row2.cells.item(6).textContent ?? ""
                    let d6 = row2.cells.item(7).textContent ?? ""
                    let mega = Mega(concurso: concurso, data: data, d1: d1, d2: d2, d3: d3, d4: d4, d5: d5, d6: d6)
                    arr.append(mega)
                }
            }
            print(arr.count)
        }
        
        
    }
    
    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

public struct Mega {
    public var concurso:String
    public var data:String
    public var d1:String
    public var d2:String
    public var d3:String
    public var d4:String
    public var d5:String
    public var d6:String
}

