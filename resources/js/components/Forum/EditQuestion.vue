<template>
    <v-container fluid>
        <v-card>
            <v-card-text>
                <v-form @submit.prevent="update">
                    <v-text-field
                        label="Title"
                        v-model="form.title"
                        type="text"></v-text-field>

                    <VueSimplemde v-model="form.body"></VueSimplemde>

                    <v-card-actions>
                        <v-btn icon small type="submit">
                            <v-icon color="teal">save</v-icon>
                        </v-btn>
                        <v-btn icon small>
                            <v-icon color="black" @click="cancel">cancel</v-icon>
                        </v-btn>
                    </v-card-actions>

                </v-form>
            </v-card-text>

        </v-card>
    </v-container>
</template>

<script>
    import VueSimplemde from 'vue-simplemde';

    export default {
        name: "EditQuestion",
        components: {VueSimplemde},
        props: ['question'],
        data: () => ({
            form: {
                title: null,
                body: null,
            }
        }),

        mounted() {
            this.form = this.question;
        },
        methods: {
            cancel() {
                EventBus.$emit('cancelEditing');
            },
            update() {
                axios.patch(`/api/questions/${this.form.slug}`, this.form)
                    .then(response => {
                        this.$swal(
                            'Updated!',
                            response.data,
                            'success'
                        );
                        this.$router.push('/forum');
                    }).catch(error => {
                    this.$swal(
                        'Not Updated!',
                        error.response.data.message,
                        'warning'
                    );
                })
            }
        }
    }
</script>

<style scoped>

</style>
