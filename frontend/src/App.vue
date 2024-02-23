<script setup lang="ts">
  import { defineAsyncComponent } from 'vue'
  import { RouterView } from 'vue-router'
  import Header from './components/Header.vue'
  import Footer from './components/Footer.vue'
  
  import { usePopupsStore } from '@/stores/popups'
  
  const popupsStore = usePopupsStore()
  
  const LoginRegisterPopup = defineAsyncComponent(
    () => import('@/components/popups/LoginRegisterPopup.vue')
  )
  const EventRegistrationPopup = defineAsyncComponent(
    () => import('@/components/popups/EventRegistrationPopup.vue')
  )
</script>

<template>
  <Header />
  <RouterView />
  <Footer />
  <div>
    <LoginRegisterPopup v-if="popupsStore.loginPopupOpened" />
    <EventRegistrationPopup v-if="popupsStore.eventRegisterPopupOpened" />
  </div>
</template>

<style scoped></style>
