import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "22c499c7977c0f1e6bda",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}