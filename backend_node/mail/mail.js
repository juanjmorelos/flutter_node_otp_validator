const nodemailer = require('nodemailer');
const template = require ('./mailTemplate')
const queries = require('../database/queries')

let transporter = nodemailer.createTransport({
    service: 'gmail',
    auth: {
        user: 'xxxxxxx@xxxxx.xxxx', // Remplaza con tu email
        pass: 'xxxxxxxxxxxxxxx' // Remplaza con tu contraseña
    }
});

// Email options
const sendMail = async (mail, name, res) => {
    try {
        const token = Math.floor(Math.random() * 900000) + 100000;

        let mailOptions = {
            from: 'xxxxxxx@xxxxx.xxxx', //Reemplaza con tu email
            to: mail, // List of recipients
            subject: 'Token de acceso',
            html: template(name, token)
        };
        
        const inserted = await queries.insertToken(mail, name, token) 
        
        if(inserted) {
            await transporter.sendMail(mailOptions);
            res.status(200).json({
                success: true,
                msg: "El correo se envió al email: " + mail
            });
            return;
        }
        res.status(400).json({
            success: false,
            msg: `Hubo un error al intentar guardar el token`
        });
    } catch (error) {
        res.status(500).json({
            success: false,
            msg: `No se envió el mensaje: ${error}`
        });
    }    
    
}


module.exports = sendMail