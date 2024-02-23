import { ref, reactive, watch } from 'vue'
import { defineStore } from 'pinia'

import { type User } from '@/types/user'
import { fetchUser } from '@/services/AuthService'

export const useAuthStore = defineStore('auth', () => {
  const token = ref(localStorage.getItem('token') || '')
  const user = reactive<User>({
    username: '',
    email: '',
    role: '',
    id: '',
    name: '',
    secondName: '',
    city: '',
    dateOfBirth: new Date()
  })
  const loggedIn = ref(false)
  
  watch(token, (token: string) => {
    localStorage.setItem('token', token)
  })
  
  if (token.value.length > 0) {
    loggedIn.value = true
    fetchUser(token.value).then((fetchedUser: User) => {
      console.log(fetchedUser)
      Object.assign(user, fetchedUser)
    })
  }
  
  return { token, user, loggedIn }
})
