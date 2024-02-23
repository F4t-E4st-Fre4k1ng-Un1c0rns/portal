<script setup lang="ts">
import { defineProps } from 'vue';

import { determineSocialNetwork, type DatabaseSocialLink } from '@/types/socialNetworks'

const props = defineProps<{ social_link: DatabaseSocialLink }>()
const socialNetwork = determineSocialNetwork(props.social_link)
</script>

<template>
  <a :href="socialNetwork.link">
    <img :alt="socialNetwork.network.alt_text" :src="socialNetwork.network.icon"  />
  </a>
</template>
