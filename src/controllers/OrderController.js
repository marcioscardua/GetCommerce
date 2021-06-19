const knex = require('../database')
const  axios = require('axios')
const xml2js = require('xml2js')


module.exports = {

    async list(req, res){

        //fazer um paginacao com o status de pagina
        
        //Fazer os join do cliente e produto
        
        const results = await knex('orders')

        return res.json(results)

    },
    async create(req, res, next){
        try {
            const order = {...req.body}

            //validar
          
            
            await knex('orders').insert(order)

            return res.status(201).send()
        } catch (error) {
            next(error)
        }
    },
    async update(req, res, next){
        try {
            const neworder = {...req.body}
            const {id} = req.params
            //console.log(req.query.pronto)
            //console.log(req.query.final)
            await knex('orders').update(neworder).where({id})
          
            res.send()
        } catch (error) {
            next(error)
        }
    },
    async delete(req, res, next){
        try {
            const id = req.params.id          
            await knex('orders').where({id}).del()

            return res.send()
        } catch (error) {
            next(error)
            
        }
        

    },

    async valueDelivery(req, res, next) {

        try {
            //Colocar no corpo de uma requisicao
            const cep_origem = "79070295"
            const cep_destino = "78892151"
            const parser = new xml2js.Parser

            const api_correios_xml = await axios.get(`http://ws.correios.com.br/calculador/CalcPrecoPrazo.aspx?nCdEmpresa=08082650&sDsSenha=564321&sCepOrigem=${cep_origem}&sCepDestino=${cep_destino}&nVlPeso=1&nCdFormato=1&nVlComprimento=20&nVlAltura=20&nVlLargura=20&sCdMaoPropria=n&nVlValorDeclarado=0&sCdAvisoRecebimento=n&nCdServico=04510&nVlDiametro=0&StrRetorno=xml&nIndicaCalculo=3`)
            
            .then(function (response) {
                parser.parseStringPromise(response.data).then(function (result) {
                        const retorno = JSON.stringify(result.Servicos.cServico,  ['Valor', 'PrazoEntrega', 'MsgErro'])
                            return res.status(202).send(retorno)
                    })
                    .catch(function (error) {
                        return res.status(202).send("Erro no servidor dos Correios")
                    })
            })
          
        } catch (error) {
            next(error)
        }
    }
}