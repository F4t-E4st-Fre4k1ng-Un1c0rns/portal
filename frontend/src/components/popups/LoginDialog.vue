<script setup lang="ts">
import { ref } from 'vue'

import { useAuthStore } from '@/stores/auth'
import { usePopupsStore } from '@/stores/popups'

const dialog = ref<HTMLDialogElement | null>(null)

const authStore = useAuthStore()
const popupsStore = usePopupsStore()

const openDialog = () => {
  dialog.value?.showModal()
}

const closeDialog = (event: any) => {
  dialog.value?.close()
}

const clickOnBackdrop = (event: any) => {
  let rect = event.target.getBoundingClientRect();
  if (rect.left > event.clientX ||
      rect.right < event.clientX ||
      rect.top > event.clientY ||
      rect.bottom < event.clientY
  ) {
      dialog.value?.close();
  }
}

const openLoginPage = () => {
  popupsStore.loginPopupOpened = true
  dialog.value?.close()
}
</script>

<template>
  <button class="burger" @click="openDialog()">
    <img src="@/assets/images/icons/burger.svg" alt="О пользователе" />
  </button>
  <dialog ref="dialog" class="auth-dialog" @click="clickOnBackdrop">
    <button class="close" @click="closeDialog">
      <img src="@/assets/images/icons/close.svg" alt="Закрыть" />
    </button>
    <button v-if="!authStore.loggedIn" @click="openLoginPage()" class="auth-button">Авторизация</button>
    <div v-else>
      <p class="account-name">{{ authStore.user.name }} {{ authStore.user.secondName }}</p>
      <button 
        @click="authStore.$reset()" class="auth-button">
        Выйти
      </button>
    </div>
  </dialog>
</template>

<style scoped>
@import '@/assets/styles/popups/login-dialog.css';
</style>
