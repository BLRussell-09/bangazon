﻿import React from 'react';

import './BrowseCategories.css';
import ProductRequests from '../Requests/ProductRequests';

//import placeholder for firebase

class BrowseCategories extends React.Component {
    state = {
        categories: [],
        originalCategories: [],
        value: ''
    };

    //*********SEARCH DATABASE FOR USER INPUT AND COLLECT MATCHES*******//
    componentDidMount() {
        const keepers = [];
        ProductRequests
            .GetAll()
            .then((categories) => {
                this.setState({ originalCategories: categories });
                const copyOfOriginal = [...categories];
                copyOfOriginal.forEach((category) => {
                    const foundCategory = keepers.find((keepCategory) => {
                        return keepCategory.uniqueCategoryKey === category.uniqueCategoryKey;
                    });
                    if (foundCategory === undefined) {
                        keepers.push(category);
                    }
                });
                this.setState({ categories: keepers });
            })
            .catch((error) => {
                console.error('error with retrieving categories', error);
            });

    }


    //***********STANDARDIZE CASE OF SEARCH & DATABASE INPUT************//
    componentWillReceiveProps() {
        const searchInput = this.props.value;
        const categories = [...this.state.originalCategories];
        const filterCategories = categories.filter(category => category.category.toLowerCase().includes(searchInput.toLowerCase()));
        this.setState({ categories: filterCategories });
    }

    render() {
        const { categories } = this.state;
        const categoryComponents = categories.map((category) => (
            <div key={category.id}>
                <table className="table table-bordered table-striped">
                    <tbody>
                        <tr>
                            <td>{category.category}</td>
                        </tr>
                    </tbody>
                </table>
            </div>


        ));

        return (
            <div className="panel panel-primary">
                <div className="panel-heading">Categories</div>
                <div className="panel-body">
                    <ul className="categoryComp">{categoryComponents}</ul>
                </div>
            </div>
        );
    }
}

export default BrowseCategories;