//
//  RecursoViewController.swift
//  DefensaVial
//
//  Created by EDSON MOISES CORTES MOLINA on 1/29/17.
//  Copyright © 2017 mecabotware. All rights reserved.
//

import UIKit
import Eureka

class RecursoViewController: FormViewController {

    
    var nombre:     String = ""
    var direccion:  String = ""
    var nombre_a:   String = ""
    var folio:      String = ""
    var fechahora:  Date = Date()
    var fecha:      String = ""
    var hora:       String = ""
    var calle:      String = ""
    var agente:     String = ""
    var reporte:    String = ""
    
    var defensa:    String = ""
    var motivo:     String = ""
    var queja:      String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        form +++ Section("Recurso de Revisión")
            
            <<< SegmentedRow<String>("segments"){
                $0.options = ["Datos", "Argumentos", "Evidencia"]
                $0.value = "Datos"
            }
        
        form +++ Section("Datos Personales"){
                $0.tag = "datos_s_a"
                $0.hidden = "$segments != 'Datos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            
            <<< TextRow(){ row in
                row.title = "Nombre"
                row.tag = "_nombre"
                row.value = "-"
            }
            
            <<< TextRow(){ row in
                row.title = "Dirección"
                row.tag = "_direccion"
                row.value = "-"
            }
        
        form +++ Section("¿Deseas que otra persona pueda recibir notificaciones?"){
                $0.tag = "datos_s_b"
                $0.hidden = "$segments != 'Datos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
        
            <<< SwitchRow("switchRowTag"){
                $0.title = "Persona Adicional"
            }
            
            <<< TextRow(){
                $0.hidden = Condition.function(["switchRowTag"], { form in
                    return !((form.rowBy(tag: "switchRowTag") as? SwitchRow)?.value ?? false)
                })
                $0.title = "Nombre"
                $0.tag = "_nombre_a"
                $0.value = "-"
        }
        
        form +++ Section("Datos de Infracción"){
                $0.tag = "datos_s_c"
                $0.hidden = "$segments != 'Datos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextRow(){ row in
                row.title = "Folio"
                row.tag = "_folio"
                row.value = "-"
            }
            
            <<< DateTimeRow(){
                $0.title = "Fecha y Hora"
                $0.value = Date().addingTimeInterval(60*60*24)
                $0.tag = "_fechahora"
            }
            
            <<< TextRow(){ row in
                row.title = "Calle"
                row.tag = "_calle"
                row.value = "-"
            }
        
            <<< TextRow(){ row in
                row.title = "Nombre Agente"
                row.tag = "_agente"
                row.value = "-"
            }
            
        form +++ Section("¿Qué dijo el agente cuando te detuvo? Se lo más específico posible"){
                $0.tag = "datos_s_e"
                $0.hidden = "$segments != 'Datos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            
        
            <<< TextAreaRow() {
                $0.placeholder = "Reporte del Agente"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
                $0.tag = "_reporte"
                $0.value = "-"
            }
        
        
        //Second Segment
        
        
        form +++ Section("Si le respondiste algo ¿Qué le respondiste al agente de transito?"){
                $0.tag = "argumentos_s_a"
                $0.hidden = "$segments != 'Argumentos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextAreaRow() {
                $0.placeholder = "Escribe los argumentos en tu defensa"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
                $0.tag = "_defensa"
                $0.value = "-"
            }
        
        form +++ Section("Motivo de la Infracción que aparece en el acta"){
                $0.tag = "argumentos_s_b"
                $0.hidden = "$segments != 'Argumentos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextAreaRow() {
                $0.placeholder = "¿Por qué te multaron?"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
                $0.tag = "_motivo"
                $0.value = "-"
            }
        
        form +++ Section("¿Por qué consideras que es injusta la infracción? (los hechos descritos deberán ser respaldados por el audio)"){
                $0.tag = "argumentos_s_c"
                $0.hidden = "$segments != 'Argumentos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextAreaRow() {
                $0.placeholder = "Manifiesta tu inconformidad de manera breve"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
                $0.tag = "_queja"
                $0.value = "-"
            }
        
        form +++ Section("Evidencia de Audio"){
                $0.tag = "evidencia_s_a"
                $0.hidden = "$segments != 'Evidencia'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< ButtonRow() {
                $0.title = "Seleccionar Audio"
        }
    }
    
    @IBAction func sendData(_ sender: Any) {
        
        var respuestas = form.values(includeHidden: true)
        
        let dateFormatterFecha = DateFormatter()
        dateFormatterFecha.dateStyle = .short
        dateFormatterFecha.timeStyle = .none
        
        let dateFormatterHora = DateFormatter()
        dateFormatterHora.dateFormat = "HH:mm"
        
        if (respuestas["_nombre"] != nil){  nombre = respuestas["_nombre"] as! String }
        if(respuestas["_direccion"]) != nil { direccion   = respuestas["_direccion"] as! String}
        if(respuestas["_nombre_a"]) != nil {nombre_a    = respuestas["_nombre_a"] as! String} else {nombre_a = "-"}
        if(respuestas["_folio"]) != nil {folio = respuestas["_folio"] as! String}
        fechahora   = respuestas["_fechahora"] as! Date
        fecha       = dateFormatterFecha.string(from: fechahora)
        hora        = dateFormatterHora.string(from: fechahora)
        if(respuestas["_calle"]) != nil {calle = respuestas["_calle"] as! String}
        if(respuestas["_agente"]) != nil{ agente     = respuestas["_agente"] as! String}
        if(respuestas["_reporte"]) != nil{ reporte   = respuestas["_reporte"] as! String}
        if(respuestas["_defensa"]) != nil{ defensa     = respuestas["_defensa"] as! String}
        if(respuestas["_motivo"]) != nil{ motivo   = respuestas["_motivo"] as! String}
        if(respuestas["_queja"]) != nil{ queja     = respuestas["_queja"] as! String}
        
        
        print(nombre, direccion, nombre_a, folio, fecha, hora, calle, agente, reporte, defensa, motivo, queja) // Prints my name
        //print("EL NOMBRE ES:\(nombre)")
        
        var request = URLRequest(url: URL(string: "http://mecabotware.com/pruebas/justiciavial/public/api")!)
        request.httpMethod = "POST"
        //let postString = "id=13&name=Jack"
        let postString = "nombre=\(nombre)&domicilio=\(direccion)&folioMulta=\(folio)&fechaMulta=\(fecha)&agente=\(agente)&horaIncidente=\(hora)&calleIncidente=\(calle)&reporteAgente=\(reporte)&motivoMulta=\(motivo)&queja=\(queja)&defensaPropia=\(defensa)"
        
        request.httpBody = postString.data(using: .utf8)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {                                                 // check for fundamental networking error
                print("error=\(error)")
                return
            }
            
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(response)")
                
                //print("response = \(response as? NSObject)")
                
                if(httpStatus.statusCode == 400){
                    let alert = UIAlertController(title: "Error", message: "Faltan campos por llenar", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                if(httpStatus.statusCode == 201){
                    let alert = UIAlertController(title: "Felicidades", message: "Tu documento ha sido generado", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
            
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(responseString)")
        }
        task.resume()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelar(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func formato(_ sender: Any) {
        let url = URL(string: "http://mecabotware.com/pruebas/justiciavial/public/pdf/defensavial035.pdf")!
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
