<script setup lang="ts">
import { ref } from 'vue'

import LoginRegisterPopup from './LoginRegisterPopup.vue'
import { useAuthStore } from '@/stores/auth'

const dialog = ref<HTMLDialogElement | null>(null)
const loginPopup = ref<typeof LoginRegisterPopup | null>(null)

const authStore = useAuthStore()
console.log(authStore.user, authStore.user.name), 4

const openDialog = () => {
  dialog.value?.showModal()
}

const closeDialog = () => {
  dialog.value?.close()
}

const openLoginPage = () => {
  dialog.value?.close()
  loginPopup.value?.openDialog()
}
</script>

<template>
  <button class="burger" @click="openDialog()">
    <img src="@/assets/images/icons/burger.svg" alt="О пользователе" />
  </button>
  <dialog ref="dialog" class="auth-dialog">
    <button class="close" @click="closeDialog()">
      <img src="@/assets/images/icons/close.svg" alt="Закрыть" />
    </button>
    <button v-if="!authStore.loggedIn" @click="openLoginPage()" class="auth-button">Авторизация</button>
    <p v-else>{{ authStore.user.name }} {{ authStore.user.secondName }}</p>
    <!-- TODO: fix design for logged in users -->
  </dialog>

  <LoginRegisterPopup ref="loginPopup" />
</template>

<style scoped>
@import '@/assets/styles/popups/login-dialog.css';
</style>
