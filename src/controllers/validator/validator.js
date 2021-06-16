
const  axios = require('axios')
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
    async adressCep(input){   
        const cep = await axios.get(`http://viacep.com.br/ws/${input}/json/`)
       // console.log(cep.data)
        return cep.data

    }


    

}