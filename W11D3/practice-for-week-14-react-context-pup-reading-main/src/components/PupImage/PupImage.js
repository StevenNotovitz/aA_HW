import {usePuppyType} from '../../context/PupContext';

const PupImage = () => {
  const {puppyType} = usePuppyType();

  if (puppyType === "select") return null;
  return (
    <img src={puppyType} alt="pup" />
  );
};

export default PupImage;