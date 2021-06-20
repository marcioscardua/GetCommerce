
const  axios = require('axios')
const assert  =require('assert')
const { throws } = require('assert')
module.exports = {

    existsOrError(input, error){
        if(!input){
            throw error
        }
        if(Array.isArray(input) && input.length === 0){
            throw error
        }
        if(typeof input === 'string' && !input.trim()){
            throw error
        }
    },
    notExistsOrError(input, error){
        try {
            this.existsOrError(input, error)
        } catch (error) {
            return
        }
        throw error
    },
    equalsOrError(inputA, inputB, error){
        if(inputA !== inputB)
            throw error
    },

    //Consulta uma api que retorna o restante das informacoes
     async adressCep(input, error) {
        //enviar pelo  body
        const cep_restrito = "79070-295"
        try {
            const cep =  await axios.get(`http://viacep.com.br/ws/${input}/json/`).then(function (response) {
                if(!response.data.cep){
                    throw error                    
                }if(response.data.cep === cep_restrito){
                    console.log(response.data.cep)
                    error =  "Impossivel realizar o envio para seu CEP."
                    throw error                     
                }else{
                    return
                }
            })       
        } catch (error) {
            throw error
        }
    }
}