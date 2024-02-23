<script setup lang="ts">
import { ref } from 'vue'

import { type EventBasic } from '@/types/event'
import type Ticket from '@/types/ticket'
import { dateStartAndEndToHumanReadableConverter } from '@/services/Date'
import PopupHeader from '@/components/popups/PopupHeader.vue'
import Form from '@/components/popups/eventRegistration/Form.vue'

enum Tab {
  Form = 1,
  Payment = 2
}

const dialog = ref<HTMLDialogElement | null>(null)
const tab = ref(Tab.Form)

defineProps<{
  event: EventBasic,
  ticket: Ticket
}>()

const nextTab = () => {
  tab.value += 1
}

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
  <dialog ref="dialog" class="login-register-dialog event-registration-dialog">
    <PopupHeader :closeDialog="closeDialog" />
    <main>
      <h1>Регистрация на «{{ event.title }}»</h1>
      <div class="tags">
        <p>{{ event.sport_type.name }}</p>
        <p>{{ ticket.title }}</p>
        <p>{{ dateStartAndEndToHumanReadableConverter(event.participation_start, event.participation_end) }}</p>
      </div>

      <nav class="shadow">
        <button class="tab" :class="{ active: tab == Tab.Form }">
          Анкета участника
        </button>
        <button class="tab" :class="{ active: tab == Tab.Payment }">
          Оплата
        </button>
      </nav>
      <Form v-if="tab == Tab.Form" :goNext="nextTab" />
    </main>
  </dialog>
</template>

<style scoped>
@import '@/assets/styles/popups/login-register-popup.css';
@import '@/assets/styles/popups/event-registration-popup.css';
</style>
