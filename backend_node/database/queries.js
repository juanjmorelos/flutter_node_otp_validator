const connection = require('./database')

const insertToken = async (email, name, token) => {
    try {
        await connection.query('INSERT INTO users VALUES (?, ?, ?, ?)', 
        [null, name, email, token]);
        return true;
    } catch (error) {
        console.log(error)
        return false;
    }
}

const verifyToken = async (email, token) => {
    try {
        const [rows] = await connection.query('SELECT * FROM users WHERE email = ? and token = ?', [email, token]);
        if (rows.length > 0) {
            const result = await deleteEmail(rows[0].userId)
            return result;
        } else {
            return false
        }
    } catch (error) {
        console.log(error)
        return false;
    }
}

const deleteEmail = async (id) => {
    try {
        await connection.query('DELETE FROM users WHERE userId = ?', [id]);
        return true
    } catch (error) {
        console.log(error)
        return false;
    }
}

module.exports = {
    insertToken,
    verifyToken
}