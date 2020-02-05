//
//  EventsViewController.swift
//  test
//
//  Created by Randy on 2/3/20.
//  Copyright © 2020 test. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class EventsViewController: UIViewController {

    @IBOutlet weak var lblNom: UILabel!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblVistos: UILabel!
    @IBOutlet weak var lblComentario: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    @IBOutlet weak var imgVistos: UIImageView!
    @IBOutlet weak var imgComment: UIImageView!
    @IBOutlet weak var imgHeart: UIImageView!
    @IBOutlet weak var imgHeartRed: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let service = EventsRepository()
        service.getAll() { (result) in
            switch result {
                case .failure(let error):
                    self.showAlert(withTitle: "Error", message: error.localizedDescription)
                    
                case .success(let userJSON):
                    //self.showAlert(withTitle: "Succes", message: "Recepcion correctas")
                   
                    for item in userJSON["historias"].arrayValue {
                        let varID = item["id"].stringValue
                        if  varID == "5944"{
                            self.lblTitulo.text = item["d"].stringValue
                            self.lblTiempo.text = item["tf"].stringValue
                            self.lblVistos.text = item["v"].stringValue
                            self.lblComentario.text = item["c"].stringValue
                            
                            let urlImgCompleto = item["f"].stringValue
                            let varAncho = item["fw"].stringValue
                            let varAlto = item["fh"].stringValue
                            self.cargarImagen(urlImgCompleto, varAncho, varAlto)
                            
                            let varFL:Bool! = Bool(item["fl"].stringValue)
                            if  varFL == true {
                                let igmUIImage = UIImage(named: "heartRed")
                                self.imgHeartRed.image = igmUIImage
                            }
                        
                        break
                       }
                    }
                   
                    self.lblNom.text = userJSON["usuario_3681"]["nombre"].stringValue
            }
        }
    }
    
    func cargarImagen(_ urlImgCompleto:String,_ varAncho:String,_ varAlto:String){

        guard let urlURL = URL(string: urlImgCompleto) else {return}
        do{
            let objData = try Data(contentsOf: urlURL)
            
            let igmUIImage = UIImage(data: objData)
            self.imgFoto.image = igmUIImage

            let ancho: Int! = Int(varAncho)
            let alto: Int! = Int(varAlto)
            
            imgFoto.frame = CGRect(x: 0, y: 120, width: ancho, height: alto)
        }
        catch{}
    }
    
}
