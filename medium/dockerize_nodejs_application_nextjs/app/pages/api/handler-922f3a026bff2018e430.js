export default function handler(req, res) {
  res.status(200).json({
    message: "922f3a026bff2018e430",
    timestamp: new Date().toISOString(),
  });
}