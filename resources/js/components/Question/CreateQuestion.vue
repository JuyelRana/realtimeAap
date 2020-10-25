<template>
    <v-container>
        <v-form @submit.prevent="save">

            <v-text-field
                label="Title"
                v-model="form.title"
                type="text"></v-text-field>

            <v-select
                :items="categories"
                item-text="name"
                item-value="id"
                v-model="form.category_id"
                label="Category"
                autocomplete></v-select>

            <VueSimplemde v-model="form.body"></VueSimplemde>

            <v-btn color="green" type="submit">Save</v-btn>
        </v-form>
    </v-container>
</template>

<script>
    import VueSimplemde from 'vue-simplemde';

    export default {
        components: {
            VueSimplemde
        },
        data: () => ({
            categories: [],
            form: {
                title: null,
                body: null,
                category_id: null

            },
            errors: {},
        }),

        created() {

            axios.get('/api/categories/')
                .then(res => {
                    res.data.data.forEach(category => {
                        this.categories.push(category);
                    });
                }).catch(error => {
                console.log(error.response.data)
            })
        },

        methods: {
            save() {
                axios.post('/api/questions/', this.form)
                    .then(res => {
                        // console.log(res.data)
                        this.$swal(
                            'Added!',
                            'New Question Added Successfully!',
                            'success'
                        );

                        this.$router.push(res.data.path);
                    }).catch(error => {
                    this.errors = error.response.data.error;
                })
            }
        }
    }
</script>

<style>

</style>
