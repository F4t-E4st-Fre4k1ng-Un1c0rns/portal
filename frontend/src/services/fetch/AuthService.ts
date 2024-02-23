import { type RegisterSchema } from '@/types/registerSchema'
import { type LoginSchema } from '@/types/loginSchema'

async function register(schema: RegisterSchema) {
  let request = await fetch(`${import.meta.env.VITE_AUTH_BASE_API}/register`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(schema), 
  })

  if (!request.ok) {
    throw Error
  }
  return login({
    username: schema.username,
    password: schema.password
  })
}

async function login(schema: LoginSchema) {
  let request = await fetch(`${import.meta.env.VITE_AUTH_BASE_API}/login`, {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify(schema), 
  })
  if (!request.ok) {
    throw Error
  }
}

export { register, login }

