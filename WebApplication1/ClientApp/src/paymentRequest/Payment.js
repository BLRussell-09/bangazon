﻿import axios from 'axios';


const getPayments = () => {
    return new Promise((resolve, reject) => {
        axios
            .get('/api/paymentType')
            .then(res => {
                const paymentTypes = [];
                if (res.data !== null) {
                    Object.keys(res.data).forEach(payKey => {
                        res.data[payKey].id = payKey;
                        paymentTypes.push(res.data[payKey]);
                    });
                }
                resolve(paymentTypes);
            })
            .catch((err) => {
                reject(err);
            });
    });
};

export default { getPayments };
