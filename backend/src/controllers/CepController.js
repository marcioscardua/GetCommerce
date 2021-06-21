const validator = require('./validator/validator')
const axios = require('axios')
module.exports = {

    async seachCep(req, res, next) {
        try {
            const cep_base = req.params.cep
            if (cep_base === "") {
               // console.log("saiu")
                return res.status(400).json({
                    "cep": "vazio"
                })
            }
            const cep_restrito = "79070-291"
            const cep = await axios.get(`http://viacep.com.br/ws/${cep_base}/json/`).then(function (response) {
                if (response.data.cep === cep_restrito) {
                    return res.status(201).json({
                        "cep": "restrito"
                    })
                }
                return res.status(201).json(response.data)
            })
        } catch (error) {
            next(error)
        }
    }
}
