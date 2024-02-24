<script setup lang="ts">
  import { ref } from 'vue'
  import { useRoute } from 'vue-router';
  import LoadingState from '@/types/loading'
  import { getData } from '@/services/EventParticipantsData'
  import { type User } from '@/types/user'

  const route = useRoute()
  const loadingState = ref(LoadingState.Loading)
  let users: User[] | undefined = undefined

  getData(route.params.event_id)
    .then((loadedUsers) => {
      users = loadedUsers
      loadingState.value = LoadingState.Ok
    })
    .catch((err) => {
      console.error(err)
      loadingState.value = LoadingState.Error
    })


</script>

<template>
  <p v-if="loadingState == LoadingState.Loading">Пожалуйста, подождите</p>
  <div v-else-if="loadingState == LoadingState.Ok">
    <ul>
      <li v-for="user in users" class="profile">
        <svg width="62" height="62" viewBox="0 0 62 62" fill="none" xmlns="http://www.w3.org/2000/svg">
          <circle cx="31" cy="31" r="31"/>
        </svg>
        <p class="name">{{ user.name }} {{ user.secondName }}</p>
        <p>{{ user.city }}</p>
      </li>
    </ul>
  </div>
  <h1 v-else-if="loadingState == LoadingState.Error">Произошла ошибка 😞</h1>
</template>

<style scoped>
@import url(@/assets/styles/event-participants.css);
</style>
