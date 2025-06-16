export default function handler(req, res) {
  res.status(200).json({
    message: "022b069b13ccb5f5b833",
    timestamp: new Date().toISOString(),
  });
}