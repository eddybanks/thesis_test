class Location extends React.Component {
  render () {
    return (
      <div>
        <div>Name: {this.props.name}</div>
        <div>Created By: {this.props.createdBy}</div>
      </div>
    );
  }
}

Location.propTypes = {
  name: React.PropTypes.string,
  createdBy: React.PropTypes.instanceOf(User)
};
