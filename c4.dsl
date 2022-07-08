workspace {
    model {

        aluno = person "Aluno" "Indivíduo que recebe instrução ou educação na Instituição ABC"
        
        enterprise "Intituição ABC" {
            staff = person "Funcionário" "Profissionais de um departamento da Instituição ABC"
            coordenador = person "Coordenador" "Funcionário da instituição que coordena um departamento"
            professor = person "Profissional" "Funcinário da instituição que ministra as aulas de um curso ou disciplina"

            softwareSystem = softwareSystem "Instituição ABC" "Permite gestão de processos operacionais, administrativos e acadêmicos. Também monitora casos de covid19." {
                webApp = container "Aplicação Canvas" "Funcionalidades acadêmicas para alunos, professores e coordenadores " "Vue.js" "Web Browser"
                webAppAdministrativo = container "Aplicação Administrativa" "Funcionalidades operacionais e administrativas para funcionários" "Vue.js" "Web Browser"
                webApi = container "Api Instituição ABC" "Providencia funcionalidades via JSON/HTTPS API" ".NET 6" "API"
                database = container "Database" "Armazena dados referentes a Instituição ABC e seus usuários" "SQL Server" "Database"
                
                webApp -> webApi "Faz solicitações acadêmicas para" "JSON/HTTPS"
                webAppAdministrativo -> webApi "Faz solicitações operacionais e administrativas para" "JSON/HTTPS"
                webApi -> database "Salva e consome dados usando" "SQL"
                
            }

            staff -> webAppAdministrativo "Faz processos administrativos usando"
            coordenador -> webApp "Faz processos administrativos e acadêmicos usando"
            professor -> webApp "Faz processos acadêmicos usando"
            aluno -> webApp "Faz processos acadêmicos usando"
        }
        
        emailSystem = softwareSystem "Sistema de E-Mail" "Dispara e-mails para os usuários" "External"
        paymentSystem = softwareSystem "Sistema de Pagamento" "Disponibilizada funcionalidades para pagamentos via PIX/Boleto/Cartão de Crédito" "External"
        identitySystem = softwareSystem "Sistema de Identidade" "Gerencia contas e senhas de usuários" "External"
        
        webApi -> emailSystem "Faz solicitações de disparo de e-mails utilizando" "JSON/HTTPS"
        webApi -> paymentSystem "Faz pagamentos e consultas sobre pagamentos utilizando" "JSON/HTTPS"
        webApi -> identitySystem "Faz solicitações de autenticação e autorização utilizando" "JSON/HTTPS"
    }

    views {
        systemContext softwareSystem {
            include *
            autolayout lr
        }

        container softwareSystem {
            include *
            autolayout lr
        }

        theme default
        
        styles {
            element "Person" {
                color #ffffff
                fontSize 22
                shape Person
            }
            element "User" {
                background #08427b
            }
            element "Staff" {
                background #999999
            }
            element "Software System" {
                background #1168bd
                color #ffffff
            }
            element "External" {
                background #A9A9A9
            }
            element "Existing System" {
                background #999999
                color #ffffff
            }
            element "Container" {
                background #438dd5
                color #ffffff
            }
            element "Web Browser" {
                shape WebBrowser
            }
            element "Mobile App" {
                shape MobileDeviceLandscape
            }
            element "Database" {
                shape Cylinder
            }
            element "Component" {
                background #85bbf0
                color #000000
            }
            element "Failover" {
                opacity 25
            }
        }
}
