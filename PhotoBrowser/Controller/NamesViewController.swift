//
//  NamesViewController.swift
//  PhotoBrowser
//
//  Created by Esmaeil MIRZAEE on 23/12/2019.
//  Copyright © 2019 Esmaeil MIRZAEE. All rights reserved.
//

import Cocoa

class NamesViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  
  @IBOutlet weak var tableView: NSTableView!
  
  var namesOfFlowers = [String]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
    
    fileManager()
  }
  
  func tableViewSelectionDidChange(_ notification: Notification) {
    guard let splitViewController = parent as? NSSplitViewController else { return }
    let photoVC = splitViewController.children[1] as? PhotoViewController
    photoVC?.imageSelected(flowerName: namesOfFlowers[tableView.selectedRow])
    
  }
  
  func fileManager() {
    let file_manager = FileManager.default
    guard let path = Bundle.main.resourcePath else { return }
    let items = try! file_manager.contentsOfDirectory(atPath: path)
    
    for item in items {
      if item.hasSuffix("jpg") {
        flowerNameGenerator((item.components(separatedBy: ".")).first ?? "")
      }
    }
  }
  
  func flowerNameGenerator(_ item: String) {
    namesOfFlowers.append(item)
  }
  
  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let view = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView
    view?.textField?.stringValue = namesOfFlowers[row]
    
    return view
  }
  
  func numberOfRows(in tableView: NSTableView) -> Int {
    return namesOfFlowers.count
  }
  
}
