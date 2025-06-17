import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "633f3e13629bb5ece815",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}