//
//  UserInfo.swift
//  UNIP Plus
//
//  Created by Jose Franklin da Silva Alves on 26/09/19.
//  Copyright © 2019 Mobile Class. All rights reserved.
//

import Foundation

class UserInfo: Codable {
    var Valido: Bool = false
    var Active: Bool = false
    var Matricula: String?
    var Nome: String?
    var CursoNome: String?
    var Perfil: String?
    var Instituto: String?
    var Token: String?
    var Mensagem: String?
    var Ensino: String?
    var DataExpiracao: Int = 0
    var Email: String?
    var CpaPesquisa: Int = 0
    var PendenteAtivacaoAva: Bool = false
    var PendenteDadosCadastrais: Bool = false
    var Tutelado: Bool = false
    var SituacaoAluno: String?
    var ImageUrl: String?
    var Enade: Bool = false
}
