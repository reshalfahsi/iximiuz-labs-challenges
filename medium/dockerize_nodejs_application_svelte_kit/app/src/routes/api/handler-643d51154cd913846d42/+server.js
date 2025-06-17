import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "643d51154cd913846d42",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}