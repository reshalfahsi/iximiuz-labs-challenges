import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "edc8048253f537054fef",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}