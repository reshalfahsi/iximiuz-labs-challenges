import { json } from '@sveltejs/kit';
import { v4 as uuidv4 } from "uuid";

export function GET() {  
  return json({
    message: "ceda5aedcd9a6c95af37",
    id: uuidv4(),
    timestamp: new Date().toISOString(),
  });
}