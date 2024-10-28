const express = require("express");
const router = express.Router();
const {
  getNotes,
  createNote,
  updateNote,
  deleteNote,
  searchNotes
} = require("../controllers/noteController");
const auth = require("../middleware/auth");

router.get("/", auth, getNotes);
router.post("/", auth, createNote);
router.put("/:id", auth, updateNote);
router.delete("/:id", auth, deleteNote);
router.get("/search", auth, searchNotes);

module.exports = router;
