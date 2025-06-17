import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "62267b73c0721bb5aae8",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}