export default function handler(req, res) {
  res.status(200).json({
    message: "dc7ed151b0a78b94532d",
    timestamp: new Date().toISOString(),
  });
}