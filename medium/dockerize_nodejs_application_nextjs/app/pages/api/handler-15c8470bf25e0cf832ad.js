export default function handler(req, res) {
  res.status(200).json({
    message: "15c8470bf25e0cf832ad",
    timestamp: new Date().toISOString(),
  });
}