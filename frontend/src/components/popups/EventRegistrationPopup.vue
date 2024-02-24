<script setup lang="ts">
import { ref, onMounted } from 'vue'

import { type EventBasic } from '@/types/event'
import type Ticket from '@/types/ticket'
import { dateStartAndEndToHumanReadableConverter } from '@/services/Date'
import PopupHeader from '@/components/popups/PopupHeader.vue'
import Form from '@/components/popups/eventRegistration/Form.vue'
import Payment from '@/components/popups/eventRegistration/Payment.vue'
import { registerOnEvent } from '@/services/AuthService'

import { usePopupsStore } from '@/stores/popups'
import { useAuthStore } from '@/stores/auth'

const authStore = useAuthStore()
const popupsStore = usePopupsStore()

if (!authStore.loggedIn) {
    popupsStore.loginPopupOpened = true
}

enum Tab {
  Form = 1,
  Payment = 2
}

const dialog = ref<HTMLDialogElement | null>(null)
const tab = ref(Tab.Form)

const nextTab = () => {
console.log(tab.value)
  switch (tab.value) {
    case Tab.Form: {
      tab.value = Tab.Payment
      break
    }
    case Tab.Payment: {
      registerOnEvent(popupsStore.ticket.id)
      closeDialog()
      break
    }
  }
}

onMounted(() => {
  dialog.value?.showModal()
  tab.value = Tab.Form
})

const closeDialog = () => {
  popupsStore.eventRegisterPopupOpened = false
}
</script>

<template>
  <dialog ref="dialog" class="login-register-dialog event-registration-dialog">
    <PopupHeader :closeDialog="closeDialog" />
    <main>
      <h1>Регистрация на «{{ popupsStore.event.title }}»</h1>
      <div class="tags">
        <p>{{ popupsStore.event.sport_type.name }}</p>
        <p>{{ popupsStore.ticket.title }}</p>
        <p>{{ dateStartAndEndToHumanReadableConverter(
                popupsStore.event.participation_start, 
                popupsStore.event.participation_end) }}</p>
      </div>

      <nav class="shadow">
        <button class="tab" 
            :class="{ active: tab == Tab.Form }"
            @click="() => { tab = Tab.Form }">
          Анкета участника
        </button>
        <button class="tab" :class="{ active: tab == Tab.Payment }">
          Оплата
        </button>
      </nav>
      <Form v-if="tab == Tab.Form" :goNext="() => { nextTab() }" />
      <Payment v-if="tab == Tab.Payment" :goNext="nextTab" />
    </main>
  </dialog>
</template>

<style scoped>
@import '@/assets/styles/popups/login-register-popup.css';
@import '@/assets/styles/popups/event-registration-popup.css';
</style>
