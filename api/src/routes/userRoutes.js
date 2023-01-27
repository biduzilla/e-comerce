import express from "express";
import UserController from "../controllers/userController.js";

const router = express.Router();

router.get('/user', UserController.listarUsers)
router.post('/user', UserController.cadastrarUser)
router.put('/user/:id', UserController.atualizarUsers)
router.get('/user/:id', UserController.obterUserById)
router.delete('/user/:id', UserController.excluirUser)

export default router;