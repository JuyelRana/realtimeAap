<template>
    <v-container>
        <v-form @submit.prevent="submit">
            <v-text-field
                label="Category Name"
                v-model="form.name"
                required></v-text-field>
            <span class="red--text" v-if="errors"> {{ errors }}</span><br>

            <v-btn type="submit" color="indigo" v-if="editSlug" class="white--text">Update</v-btn>
            <v-btn type="submit" color="teal" v-else>Create</v-btn>
        </v-form>

        <v-card class="mt-5">
            <v-toolbar color="indigo" dark dense>
                <v-toolbar-title>Categories</v-toolbar-title>
            </v-toolbar>

            <v-list>
                <div v-for="(category,index) in categories" :key="index">
                    <v-list-item>

                        <v-list-item-action>
                            <v-btn icon small @click="editCategory(index)">
                                <v-icon color="orange">edit</v-icon>
                            </v-btn>
                        </v-list-item-action>

                        <v-list-item-content>
                            <v-list-item-title>{{ category.name }}</v-list-item-title>
                        </v-list-item-content>

                        <v-spacer></v-spacer>

                        <v-list-item-action>
                            <v-btn icon small @click="destroy(index)">
                                <v-icon color="red">delete</v-icon>
                            </v-btn>
                        </v-list-item-action>
                    </v-list-item>
                    <v-divider></v-divider>
                </div>
            </v-list>

        </v-card>

    </v-container>
</template>

<script>
    export default {
        data: () => ({
            errors: null,
            categories: [],
            form: {
                name: null,
            },
            editSlug: null,
        }),

        created() {

            this.getCategories();

        },

        methods: {
            submit() {
                this.editSlug ? this.update() : this.create();
            },

            create() {
                axios.post('api/categories', this.form)
                    .then(response => {
                        this.categories.splice(0, this.categories.length);

                        this.getCategories();
                        this.form.name = null;
                        this.$swal(
                            'Created!',
                            response.data,
                            'success'
                        );
                    }).catch(error => {

                    this.errors = error.response.data.errors.name[0];

                    this.$swal(
                        'Problem Created!',
                        error.response.data.message,
                        'warning'
                    );
                });
            },

            update() {
                axios.patch(`/api/categories/${this.editSlug}`, this.form)
                    .then(response => {
                        this.categories.splice(0, this.categories.length);
                        this.editSlug = null;
                        this.getCategories();

                        this.form.name = null;
                        this.$swal(
                            'Updated!',
                            response.data,
                            'success'
                        );
                    }).catch(error => {
                    this.$swal(
                        'Problem Updated!',
                        error.response.data.message,
                        'warning'
                    );
                })

            },

            getCategories() {
                axios.get('/api/categories/')
                    .then(res => {

                        res.data.data.forEach(category => {
                            this.categories.push(category);
                        });

                    }).catch(error => {
                    console.log(error.response.data)
                })
            },

            destroy(index) {

                this.$swal({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {

                    if (result.value) {

                        axios.delete(`/api/categories/${this.categories[index].slug}`)
                            .then(res => {
                                this.$swal(
                                    'Deleted!',
                                    res.data,
                                    'success'
                                );
                                this.categories.splice(index, 1);
                            })
                            .catch(error => {
                                this.$swal(
                                    'Problem Deleted!',
                                    error.response.data.message,
                                    'warning'
                                );
                            });
                    }
                });
            },

            editCategory(index) {

                this.form.name = this.categories[index].name;
                this.editSlug = this.categories[index].slug;
                this.categories.splice(index, 1);
            }
        }
    }
</script>

<style>

</style>
