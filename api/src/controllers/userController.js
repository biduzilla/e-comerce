import users from '../model/User.js';

class UserController {
    static listarUsers = (req, res) => {
        users.find((err, users) => {
            res.status(200).json(users);
        })
    }

    static cadastrarUser = (req, res) => {
        let user = new users(req.body);
        user.save((err) => {
            if (err) {
                res.status(500).send({
                    mensangem: `${err.message} - falha ao cadastrar autor`
                })
            } else {
                res.status(201).send(user.toJSON());
            }
        })
    }

    static atualizarUsers = (req, res) => {
        const id = req.params.id

        users.findByIdAndUpdate(id, { $set: req.body }, (err) => {
            if (!err) {
                res.status(200).send({
                    mensagem: 'User atualizado com sucesso'
                })
            } else {
                res.status(500).send({
                    mensagem: `${err.message} - Error ao atualizar user`
                })
            }
        })
    }

    static obterUserById = (req, res) => {
        const id = req.params.id
        users.findById(id, (err, users) => {
            if (err) {
                res.status(400).send({
                    mensagem: `${err.message} - Error ao procurar user`
                })
            } else {
                res.status(200).send(users)
            }
        })
    }

    static excluirUser = (req, res) => {
        const id = req.params.id
        users.findByIdAndRemove(id,(err) => {
            if(err){
                res.status(500).send({
                    mensagem: `${err.message} - Error ao excluir autor`
                })
            }else{
                res.status(200).send({
                    mensagem: "User Removido com Sucesso"
                })
            }
        })
    }
}

export default UserController