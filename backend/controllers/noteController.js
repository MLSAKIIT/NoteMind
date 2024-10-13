const Note = require("../models/Note");

exports.getNotes = async (req, res) => {
  try {
    const notes = await Note.find({ user: req.user.id }).sort({
      createdAt: -1,
    });
    res.json(notes);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
};

exports.createNote = async (req, res) => {
  try {
    const { title, content, type } = req.body;
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
};

exports.updateNote = async (req, res) => {
  try {
    const { title, content, type } = req.body;
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
};

exports.deleteNote = async (req, res) => {
  try {
    const note = await Note.findById(req.params.id);
  } catch (err) {
    console.error(err.message);
    res.status(500).send("Server error");
  }
};
