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
            }
            
            <<< TextRow(){ row in
                row.title = "Dirección"
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
        }
        
        form +++ Section("Datos de Infracción"){
                $0.tag = "datos_s_c"
                $0.hidden = "$segments != 'Datos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextRow(){ row in
                row.title = "Folio"
            }
            
            <<< DateTimeRow(){
                $0.title = "Fecha y Hora"
                $0.value = Date().addingTimeInterval(60*60*24)
            }
            
            <<< TextRow(){ row in
                row.title = "Calle"
            }
        
            <<< TextRow(){ row in
                row.title = "Nombre Agente"
            }
            
        
            <<< TextAreaRow() {
                $0.placeholder = "Reporte del Agente"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
            }
        
        
        //Second Segment
        
        
        form +++ Section("Defensa Propia"){
                $0.tag = "argumentos_s_a"
                $0.hidden = "$segments != 'Argumentos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextAreaRow() {
                $0.placeholder = "Escribe los argumentos en tu defensa"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
            }
        
        form +++ Section("Motivo de la Multa"){
                $0.tag = "argumentos_s_b"
                $0.hidden = "$segments != 'Argumentos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextAreaRow() {
                $0.placeholder = "¿Por qué te multaron?"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
            }
        
        form +++ Section("Queja"){
                $0.tag = "argumentos_s_c"
                $0.hidden = "$segments != 'Argumentos'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< TextAreaRow() {
                $0.placeholder = "Manifiesta tu inconformidad de manera breve"
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 110)
            }
        
        form +++ Section("Evidencia de Audio"){
                $0.tag = "evidencia_s_a"
                $0.hidden = "$segments != 'Evidencia'" // .Predicate(NSPredicate(format: "$segments != 'Sport'"))
            }
            <<< ButtonRow() {
                $0.title = "Presiona para Escuchar Audio"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
