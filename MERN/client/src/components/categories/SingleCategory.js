import React from "react"
import { ListGroup } from "react-bootstrap"
const SingleCategory = ({ category: { _id, categoryName } }) => {
  const style = {
    border: 'none',
    marginBottom: '3px'
  }

    return (
        <ListGroup.Item action variant="secondary" style={style}>
            {categoryName}
        </ListGroup.Item>
    )
}

export default SingleCategory
