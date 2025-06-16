export default function handler(req, res) {
  res.status(200).json({
    message: "8f68bd0ef714643172ec",
    timestamp: new Date().toISOString(),
  });
}