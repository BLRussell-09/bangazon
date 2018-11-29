import React, {Component} from 'react';
import axios from 'axios';

import Requests from '../Requests/Requests';

import './AllProducts.css';

class AllProducts extends Component {
  state = {
    products: [],
    productId: 0,
  }

  componentDidMount() {
    return new Promise((resolve, reject) => {
      Requests.GetAll()
      .then(products => {
        // sets state with all products
        this.setState({
          products: products
        })
        resolve (products);
      })
      .catch(error => reject(error));
    });
  };

  clickProduct = e => {
    const id = e.target.name;
    this.setState({
      productId: id,
    });
    const apiPath = `api/product/${id}`;
    return new Promise((resolve, reject) => {
      axios.get(apiPath)
      // .then(product => {
      //   // sets state with all products
      //   this.setState({
      //     product: product.data
      //   })
      // })
      .then(product => {
        this.props.history.push(`/products/${this.state.productId}`);
        resolve (product);
      })
      .catch(error => reject(error));
    });
  }

  clickAddProduct = () => {

  };

  render () {
    const {
      products,
      productId,
    } = this.state;

    const output = products.map(product => {
      // Prints all product titles to DOM
      return (
        <input
          type="button"
          name={product.id}
          key={product.id}
          value={product.title}
          onClick={this.clickProduct}
        ></input>
      );
    });

    return (
      <div>
        <h1>Products</h1>
        <div>
          <h2>All Products:</h2>
          <input
            type="button"
            value="Add Product"
            onClick={this.clickaddProduct}
          />
          <div>
            {output}
          </div>
        </div>
      </div>
    );
  }
};

export default AllProducts;