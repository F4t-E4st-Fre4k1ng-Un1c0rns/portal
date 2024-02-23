import { type RegisterSchema } from '@/types/registerSchema'
import { type LoginSchema } from '@/types/loginSchema'
import { type AuthModule } from '@/types/fetchingModule'

import { useAuthStore } from '@/stores/auth'

let fetchingModule: undefined | AuthModule = undefined
if (import.meta.env.VITE_MOCKING) {
  fetchingModule = await import('./mocking/AuthService')
} else {
  fetchingModule = await import('./fetch/AuthService')
}


async function register(schema: RegisterSchema): Promise<string> {
  const token = await fetchingModule?.register(schema)
  saveUser(token)
  return token
}

async function login(schema: LoginSchema): Promise<string> {
  const token = await fetchingModule?.login(schema)
  saveUser(token)
  return token
}

async function fetchUser(token: string) {
  return await fetchingModule?.getUser(token)
}

async function saveUser(token: string) {
  const authStore = useAuthStore()
  const user = await fetchUser(token)
  authStore.token = token
  Object.assign(user, authStore.user)
}

export { register, login, fetchUser }
