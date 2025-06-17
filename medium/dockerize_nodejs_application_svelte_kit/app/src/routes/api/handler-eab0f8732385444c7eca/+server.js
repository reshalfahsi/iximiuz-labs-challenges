import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "eab0f8732385444c7eca",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}