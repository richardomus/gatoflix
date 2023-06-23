//
//  LoggedHomeViewController.swift
//  gatoflix
//
//  Created by RICARDO COUTO D ALAMBERT on 04/06/23.
//

import UIKit

class LoggedHomeViewController: UIViewController {

    let datasource = [
        SourceModel(type: "destaque", title: nil, resources: nil),
        SourceModel(
            type: "carrousel",
            title: "Séries",
            resources: ["thumb_02", "thumb_03", "thumb_03", "thumb_02", "thumb_03","thumb_02", "thumb_03", "thumb_03", "thumb_02", "thumb_03"]
        ),
        SourceModel(
            type: "carrousel",
            title: "Minha lista",
            resources: ["thumb_05", "thumb_04", "thumb_03", "thumb_02", "thumb_01"]
        ),
        SourceModel(
            type: "carrousel",
            title: "Suspense",
            resources: ["thumb_03", "thumb_02", "thumb_04", "thumb_01", "thumb_05"]
        ),
        SourceModel(type: "destaque", title: nil, resources: nil),
        SourceModel(
            type: "carrousel",
            title: "Infantil",
            resources: ["thumb_04", "thumb_03", "thumb_02", "thumb_01", "thumb_05"]
        ),
        SourceModel(
            type: "carrousel",
            title: "Variedades",
            resources: ["thumb_04", "thumb_03"]
        )
    ]
    
    let trailerURLs: [String: String] = [
        "thumb_01" : "https://www.youtube.com/watch?v=iLmZZV-Nkuk",
        "thumb_02" : "http://",
        "thumb_03" : "http://",
        "thumb_04" : "http://",
        "thumb_05" : "http://",
    ]
    
    var selectedTrailerURL: String?
    
    @IBOutlet var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.register(UINib(nibName: "LoggedHomeTableViewCell", bundle: nil), forCellReuseIdentifier: "LoggedHomeTableViewCell")
        tableView?.register(UINib(nibName: "LoggedHomeCarrouselTableViewCell", bundle: nil), forCellReuseIdentifier: "LoggedHomeCarrouselTableViewCell")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieSegue" {
            let vc = segue.destination as? MoviePreviewViewController
            vc?.trailerURL = selectedTrailerURL
        }
    }
}

extension LoggedHomeViewController: UITableViewDelegate {
    
}

extension LoggedHomeViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let data = datasource[indexPath.row]
        
        switch data.type {
        case "destaque":
            return 328
        case "carrousel":
            return 164
        default:
            return 164
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = datasource[indexPath.row]
        
        var identifier = String()
        
        switch data.type {
        case "destaque":
            identifier = "LoggedHomeTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
            return cell
        case "carrousel":
            identifier = "LoggedHomeCarrouselTableViewCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? LoggedHomeCarrouselTableViewCell
            cell?.configure(title: data.title, assetList: data.resources)
            cell?.delegate = self
            return cell ?? UITableViewCell()
        default:
            identifier = "LoggedHomeTableViewCell"
        }
        
        return UITableViewCell()
    }
}

extension LoggedHomeViewController: LoggedHomeCarrouselTableViewCellDelegate {
    
    func didSelectedMovie(movie: String?) {
        
        self.selectedTrailerURL = trailerURLs[movie ?? String()]
        
        self.performSegue(withIdentifier: "movieSegue", sender: self)
    }
}
