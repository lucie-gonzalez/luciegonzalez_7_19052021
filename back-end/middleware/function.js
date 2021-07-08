const jwt = require('jsonwebtoken')
require('dotenv').config();
// Retourne le contenu du token
exports.tokenView = (token) => {
    if (token) {

            try {
                tokenDecrypt = jwt.verify(token, process.env.SECRET )
            } catch {
                throw 'token invalid';
            }
            if (isNaN(tokenDecrypt.userId) && isNaN(tokenDecrypt.role)) throw 'token invalid: not a number'

            return tokenDecrypt
        }
        throw 'error token with post'
}