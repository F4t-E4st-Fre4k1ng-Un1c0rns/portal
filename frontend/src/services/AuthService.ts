import { type RegisterSchema } from '@/types/registerSchema'
import { type LoginSchema } from '@/types/loginSchema'
import { type AuthModule } from '@/types/fetchingModule'

let fetchingModule: undefined | AuthModule = undefined
if (import.meta.env.VITE_MOCKING) {
  fetchingModule = await import('./mocking/AuthService')
} else {
  fetchingModule = await import('./fetch/AuthService')
}

async function register(schema: RegisterSchema) {
  return fetchingModule?.register(schema)
}

async function login(schema: LoginSchema) {
  return fetchingModule?.login(schema)
}

export { register, login }
