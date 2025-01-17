<script setup lang="ts">
import { useToast } from '@/components/ui/toast/use-toast'
import { toTypedSchema } from '@vee-validate/zod'
import { useForm } from 'vee-validate'

import * as z from 'zod'

definePageMeta({
  layout: false,
})

const formSchema = toTypedSchema(z.object({
  username: z.string({ message: 'Ce champ est obligatoire' }).nonempty({ message: 'Ce champ est obligatoire' }),
  password: z.string({ message: 'Ce champ est obligatoire' }).nonempty({ message: 'Ce champ est obligatoire' }),
}))

const form = useForm({
  validationSchema: formSchema,
})

const { toast } = useToast()

const onSubmit = form.handleSubmit(async ({ username, password }) => {
  try {
    await $fetch('/api/auth/login', {
      method: 'POST',
      body: {
        username,
        password,
      },
    })
    await useUserSession().fetch()
    navigateTo('/')
  }
  catch {
    toast({
      variant: 'destructive',
      description: 'Nom d\'utilisateur ou mot de passe incorrect',
    })
  }
})
</script>

<template>
  <div class="w-full lg:grid lg:min-h-[600px] lg:grid-cols-2 xl:min-h-[800px]">
    <div class="flex items-center justify-center py-12">
      <div class="mx-auto grid w-[350px] gap-6">
        <div class="grid gap-2 text-center">
          <h1 class="text-3xl font-bold">
            Se connecter
          </h1>
        </div>
        <form class="grid gap-4" @submit="onSubmit">
          <FormField v-slot="{ componentField }" name="username">
            <FormItem>
              <FormLabel>Nom d'utilisateur</FormLabel>
              <FormControl>
                <Input
                  v-bind="componentField"
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          </FormField>
          <FormField v-slot="{ componentField }" name="password">
            <FormItem>
              <FormLabel>Mot de passe</FormLabel>
              <FormControl>
                <Input
                  v-bind="componentField"
                />
              </FormControl>
              <FormMessage />
            </FormItem>
          </FormField>
          <Button type="submit" class="w-full">
            Connexion
          </Button>
        </form>
      </div>
    </div>
    <div class="w-full h-full hidden bg-slate-900 lg:block">
      <div class="flex justify-center items-center">
        <img
          src="/images/doctorpaper.webp"
          alt="Image"
          class="object-scale-down h-[100vh]"
        >
      </div>
    </div>
    <Toaster />
  </div>
</template>
