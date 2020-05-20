<template>
    <v-container>
        <v-list-item v-if="errors.length">
            <v-list-item-content>
                <v-list-item-title v-for="(error,index) in errors" :key="index" color="red">
                    <v-alert :value="true" type="error">
                        {{ error }}
                    </v-alert>
                </v-list-item-title>
            </v-list-item-content>
        </v-list-item>

        <v-form @submit.prevent="login">

            <v-text-field
                v-model="form.email"
                label="E-mail"
                type="email"
                required></v-text-field>
            <v-text-field
                v-model="form.password"
                label="Password"
                type="password"
                required></v-text-field>

            <v-btn color="green" type="submit">Login</v-btn>

        </v-form>
    </v-container>
</template>

<script>
    export default {
        data: () => ({
            form: {
                email: null,
                password: null
            },
            errors: [],
        }),
        methods: {
            login() {
                this.errors = [];

                User.loginData(this.form, this.errors)
                
            }
        }
    }
</script>
