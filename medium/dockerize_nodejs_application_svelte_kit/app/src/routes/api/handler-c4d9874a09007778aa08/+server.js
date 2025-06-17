import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "c4d9874a09007778aa08",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}