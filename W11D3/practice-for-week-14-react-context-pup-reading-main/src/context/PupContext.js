import {createContext, useState, useContext} from 'react';
import banana from '../pups/banana-pup.jpg';
import sleepy from '../pups/sleepy-pup.jpg';
import speedy from '../pups/speedy-pup.jpg';

export const PupContext = createContext();

export function PupProvider(props) {
  const [puppyType, setPuppyType] = useState("select");

  return (
    <PupContext.Provider value={{puppyType, setPuppyType}}>
      {props.children}
    </PupContext.Provider>
  );
}

export function usePuppyType() {
  return useContext(PupContext);
}