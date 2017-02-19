import React, { Component } from 'react';

class OfferTableItem extends Component {
  render() {
    return (
      <td>
        {this.props.item.name}
      </td>
    );
  }
}

export default OfferTableItem;
