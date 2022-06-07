import React from 'react'
import { useParams  } from 'react-router-dom';


export const Users = (props: any) => {
  const { usersId } = useParams();
  console.log(props.match);
  console.log(usersId);
  return (
    <>
      <div>User</div>

      
      <p>UserIdは{usersId}</p>
    </>
  )
}

// export default Users