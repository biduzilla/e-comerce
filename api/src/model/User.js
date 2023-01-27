import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
    id: { type: String },
    nome: { type: String, require: true },
    telefone: { type: Number, require: true },
    cidade: { type: String, require: true },
    produtos: [
        {
            nome: { type: String, required: true },
            descricao: { type: String, required: true },
            imagem: { type: String, required: true },
            preco: { type: String, required: true },
        }
    ]
},
    {
        versionKer: false,
    }
)

const users = mongoose.model('users', userSchema);

export default users;