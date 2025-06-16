export default function handler(req, res) {
  res.status(200).json({
    message: "09ce7a73ac77bbf88e26",
    timestamp: new Date().toISOString(),
  });
}