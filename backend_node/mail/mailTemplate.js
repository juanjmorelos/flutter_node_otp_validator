const emailTemplate = (name, token) => {
    return `
        <div class="container" style="width: 70%; margin: auto;">
            <table class="table" style="width: 100%">
                <tbody style="font-family: system-ui; text-align: center">
                    <tr>
                        <td>
                            <span style="font-size: 24px;">Hola, ${name}</span>
                        </td>
                    </tr>
                    <tr >
                        <td style="padding-top: 22px;">
                            <span style="font-size: 20px;">Shhhh, este es tu token de acceso, no lo compartas con más nadie</span>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-top: 36px">
                            <span style="font-size: 24px; letter-spacing: 18px; padding: 10px 0px 10px 18px; border: 1px solid; text-align: center; border-radius: 10px;">${token}</span>
                        </td>
                    </tr>  
            </tbody>
        </table>
    </div>
    `
}

module.exports = emailTemplate;