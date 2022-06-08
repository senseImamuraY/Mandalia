import React from 'react';
import logo from './logo.svg';
import './App.css';

import { BrowserRouter, Routes, Route, useParams, Link } from "react-router-dom";

import { Users } from "./containers/User";
import { MainTargets } from "./containers/MainTarget";
import { SubTargets } from "./containers/SubTarget";
import PrimaryButton from './components/atoms/button/PrimaryButton';
import SecondaryButton from './components/atoms/button/SecondaryButton';


function App() {
  const { userId } = useParams();
  return (
    <>
    <PrimaryButton>logM=B</PrimaryButton>
    <SecondaryButton>logM=B</SecondaryButton>
      <BrowserRouter>
        <Link to="users/:usersId">aaa</Link>
        <Routes>
          {/* <Route path="/" element={<Home />}/> */}
          <Route path="users/:usersId" element={<Users />} />
          <Route path="main_targets" element={<MainTargets />}/>
          <Route path="sub_targets" element={<SubTargets />}/>
        </Routes>
      </BrowserRouter>
    </>
  );
}

export default App;
