<script setup lang="ts">
import { ref } from 'vue'

import LoginComponent from '@/components/popups/loginPopupComponents/LoginComponent.vue'
import RegisterComponent from '@/components/popups/loginPopupComponents/RegisterComponent.vue'
import PopupHeader from '@/components/popups/PopupHeader.vue'

enum Tab {
  Login,
  Register
}

const dialog = ref<HTMLDialogElement | null>(null)
const tab = ref(Tab.Login)

const openDialog = () => {
  dialog.value?.showModal()
}

const closeDialog = () => {
  dialog.value?.close()
}

defineExpose({
  openDialog
})
</script>

<template>
  <dialog ref="dialog" class="login-register-dialog">
    <PopupHeader :closeDialog="closeDialog" />
    <main>
      <nav class="shadow">
        <button class="tab" :class="{ active: tab == Tab.Login }"
          @click="() => { tab = Tab.Login }">
          Вход
        </button>
        <button class="tab" :class="{ active: tab == Tab.Register }"
          @click="() => { tab = Tab.Register }">
          Регистрация
        </button>
      </nav>

      <LoginComponent v-if="tab == Tab.Login" />
      <RegisterComponent v-if="tab == Tab.Register" />
    </main>
  </dialog>
</template>

<style scoped>
@import '@/assets/styles/popups/login-register-popup.css';
</style>
