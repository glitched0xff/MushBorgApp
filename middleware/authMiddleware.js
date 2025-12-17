const authMiddleware = (req, res, next) => {
    if (req.session.userId) {
      return next();
    }
    res.status(403).json({ error: 'Accesso negato. Effettua il login' });
  };
  
  module.exports = authMiddleware;