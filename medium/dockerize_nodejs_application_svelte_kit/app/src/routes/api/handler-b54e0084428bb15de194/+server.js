import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "b54e0084428bb15de194",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}