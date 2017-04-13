import React from 'react';

class OfferTableItem extends React.Component {
  render() {
    return (
      <td>
        {this.props.item.name}
      </td>
    );
  }
}

export default OfferTableItem;
