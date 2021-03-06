//
//  DetalheTrilhaViewController.swift
//  SextouNTI
//
//  Created by Rabelo on 03/06/16.
//  Copyright © 2016 br.com.fagutapp. All rights reserved.
//

import UIKit

class DetalheTrilhaViewController: UIViewController {
    
    // MARK: Model
    var trilha = Trilha()
    
    // MARK: Properties
    @IBOutlet weak var imagemUsuario: UIImageView!
    @IBOutlet weak var tituloTrilha: UILabel!
    @IBOutlet weak var decricaoTrilha: UILabel!
    @IBOutlet weak var numeroComentariosTrilha: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let utilImagem = UtilImagem()
        
        self.tituloTrilha.text = trilha?.titulo
        self.decricaoTrilha.text = trilha?.sobre
        self.imagemUsuario.image = utilImagem.achaImagemPorMatricula(String(trilha!.usuario!.matricula!))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    @IBAction func likeAction(sender: AnyObject) {
    }
    
    @IBAction func comentAction(sender: AnyObject) {
    }
    
    @IBAction func sharedAction(sender: AnyObject) {
    }
    


 
     // MARK: - Navigation
    
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     
        if segue.identifier == "segueForComents" {
            let vc: ComentarioViewController =  segue.destinationViewController as! ComentarioViewController
         
            vc.trilha = trilha!
        }
 
    }

}
