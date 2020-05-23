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

        <v-form @submit.prevent="login" v-model="valid">

            <v-text-field
                v-model="form.email"
                label="E-mail"
                :rules="formValidation.emailRules"
                type="email"
                hint="Enter Valid Email"
                required></v-text-field>

            <v-text-field
                autocomplete="current-password"
                v-model="form.password"
                label="Password"
                hint="Min. 8 characters with at least one capital letter, a number and a special character."
                :append-icon="value ? 'mdi-eye' : 'mdi-eye-off'"
                @click:append="() => (value = !value)"
                :type="value ? 'password' : 'text'"
                :rules="[formValidation.passwordRules.password]"
                @input="_=>form.password=_"
            ></v-text-field>

            <v-btn color="green" type="submit" :disabled="!valid">Login</v-btn>

            <v-btn text to="/signup" color="info">Signup</v-btn>

        </v-form>
    </v-container>
</template>

<script>
    export default {
        data: () => ({

            errors: [],

            value: true,

            valid: false,

            form: {
                email: null,
                password: null,

            },

            formValidation: {
                emailRules: [
                    v => !!v || "E-mail is required",
                    v => /.+@.+/.test(v) || "E-mail must be valid"
                ],
                passwordRules: {
                    required: value => !!value || "Required.",
                    password: value => {
                        const pattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})/;
                        return (
                            pattern.test(value) ||
                            "Min. 8 characters with at least one capital letter, a number and a special character."
                        );
                    }
                }
            }

        }),

        created() {
            if (User.loggedIn()) {
                this.$router.push({name: 'forum'})
            }
        },

        methods: {
            login() {
                this.errors = [];
                User.loginData(this.form, this.errors)
                // this.$router.push({name: 'forum'})
            }
        }
    }
</script>
