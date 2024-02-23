<script setup lang="ts">
defineProps<{
  closeDialog: Function   
}>()
</script>

<template>
  <header>
    <button @click="closeDialog()" class="back">
      <img src="@/assets/images/icons/back.svg" alt="Назад" />
    </button>
    <img src="@/assets/images/logo.svg" alt="Логотип" class="logo" />
  </header>
</template>

<style scoped>
@import url(@/assets/styles/popups/header.css);
</style>
