import express from "express";
import users from "./userRoutes.js"
import cors from "cors";

const routes = (app) => {
    app.route('/').get((req,res)=>{
        res.status(200).send({
            mensagem: 'Api Cadastro User'
        })
    })

    app.use(cors({
        origin: '*',
        methods: ['GET','POST','DELETE','UPDATE','PUT','PATCH']
    }),express.json(), users)
}

export default routes;