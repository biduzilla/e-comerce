import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
    id: { type: String },
    nome: { type: String, require: true },
    telefone: { type: Number, require: true },
    cidade: { type: String, require: true },
},
    {
        versionKer: false,
    }
)

const users = mongoose.model('users',userSchema);

export default users;