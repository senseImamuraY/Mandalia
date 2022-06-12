import React from 'react'
import styled from "styled-components";

const SecondaryButton = (props: any) => {
  const { children } = props;
  return (
    <>
      <SButton>{children}</SButton>
    </>
  )
}

export default SecondaryButton

const SButton = styled.button`
  background-color: #11999e;
  color: #fff;
  padding: 6px 24px;
  border: none;
  border-radius: 9999px;
  outline: none;
  &:hover {
    cursor: pointer;
    opacity: 0.8;
  }
`