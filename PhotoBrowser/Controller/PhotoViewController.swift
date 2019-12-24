//
//  PhotosViewController.swift
//  PhotoBrowser
//
//  Created by Esmaeil MIRZAEE on 23/12/2019.
//  Copyright © 2019 Esmaeil MIRZAEE. All rights reserved.
//

import Cocoa

class PhotoViewController: NSViewController {
  
  @IBOutlet weak var imageView: NSImageView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do view setup here.
  }

  func imageSelected(flowerName: String) {
    imageView.image = NSImage(named: flowerName)
  }
}
