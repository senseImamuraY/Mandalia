import { useEffect } from 'react'
import { useParams } from 'react-router-dom';
import { FetchUser } from '../apis/users';
// import { DEFAULT_API_LOCALHOST } from "../urls/index";
export const Users = (props: any) => {
  const { usersId } = useParams();
  // console.log(props.match);
  // console.log(DEFAULT_API_LOCALHOST);
  // const { usesId } = useParams();
  useEffect(() => {
    FetchUser(usersId)
      .then((data) =>
        console.log(data)
      )
  }, [])

  return (
  
    <>
      <div>User</div>

      
      <p>UserIdは{usersId}</p>
    </>
  )
}

// export default Users