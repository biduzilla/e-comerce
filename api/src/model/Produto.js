import mongoose from "mongoose";

const produtoSchema = new mongoose.Schema({
    id: { type: String },
    nome: { type: String, required: true },
    descricao: { type: String, required: true },
    imagem: { type: String, required: true },
    preco: { type: String, required: true },
}, {
    versionKey: false,
})

const produtos = mongoose.model("produtos", produtoSchema)

export default produtos;