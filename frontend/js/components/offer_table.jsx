import React, { Component } from 'react';
import OfferTableItem from 'offer_table_item';

class OfferTable extends Component {
  render() {
    const tableBody = this.props.items.map(item =>
      <tr key={item.name.toString()}><OfferTableItem item={item} /></tr>,
    );
    return (
      <table>
        <tbody>
          {tableBody}
        </tbody>
      </table>
    );
  }
}

export default OfferTable;
