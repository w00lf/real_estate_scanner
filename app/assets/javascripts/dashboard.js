import React from 'react';
import ReactDOM from 'react-dom';
import OfferTable from 'offer_table'

let items = Array
            .from(new Array(5),(val,index)=> index + 1)
            .map((item) => ({ name: item }));
ReactDOM.render(
  <OfferTable items={items} />,
  document.getElementById('root')
);
