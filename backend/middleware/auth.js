const jwt = require('jsonwebtoken');

const bearer = (req, res, next) => {
  const authHeader = req.header('Authorization');
  const token = authHeader?.split('Bearer ')[1];
    
    if (!token) {
        return res.status(401).json({ msg: 'No token, authorization denied' });
    }

    try {
        req.user = jwt.verify(token, process.env.JWT_SECRET);
        next();
    } catch (err) {
        res.status(401).json({ msg: 'Invalid token' });
    }
};

module.exports = bearer;