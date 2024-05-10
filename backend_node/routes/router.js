const sendMail = require('../mail/mail');
var express = require('express');
var queries = require('../database/queries')


var routes = express();

routes.post('/confirm', (req, res) => {
    const email = req.body.email
	const name = req.body.name
	let emptyFields = []

	if(email == undefined) {
		emptyFields.push('email')
	}

	if(name == undefined) {
		emptyFields.push('name')
	}

	if(emptyFields.length == 0) {
		sendMail(email, name, res)
		return
	}
	res.status(400).json({
		success: false,
		msg: "Se encontraron campos vacíos",
		emptyFields
	});
});

routes.post('/verifyToken', async (req, res) => {
	const { email, token} = req.body
	let emptyFields = []

	if(email == undefined) {
		emptyFields.push('email')
	}

	if(token == undefined) {
		emptyFields.push('token')
	}

	if(emptyFields.length == 0) {
		const exist = await queries.verifyToken(email, token)
		if(exist) {
			res.json({
				success: true,
				msg: "Token correcto"
			})
		} else {
			res.status(403).json({
				success: false,
				msg: "Token invalido"
			});
		}
		return
	}
	res.status(400).json({
		success: false,
		msg: "Se encontraron campos vacíos",
		emptyFields
	});
})

module.exports = routes;