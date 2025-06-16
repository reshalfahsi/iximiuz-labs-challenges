export default function handler(req, res) {
  res.status(200).json({
    message: "327dac9fd9190ead9705",
    timestamp: new Date().toISOString(),
  });
}