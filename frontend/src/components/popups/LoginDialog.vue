<script setup lang="ts">
import { ref } from 'vue'

import LoginRegisterPopup from './LoginRegisterPopup.vue';

const dialog = ref<HTMLDialogElement | null>(null)
const loginPopup = ref<typeof LoginRegisterPopup | null>(null)

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
    <button @click="openLoginPage()" class="auth-button">Авторизация</button>
  </dialog>

  <LoginRegisterPopup ref="loginPopup" />
</template>

<style scoped>
@import '@/assets/styles/popups/login-dialog.css';
</style>
