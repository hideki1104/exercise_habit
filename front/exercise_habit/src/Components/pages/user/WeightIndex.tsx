import React from 'react';
import { UserContainer } from '../../templates/UserContainer';
import { WeightManagement } from '../../organisms/Weight/WeightManagement';

interface WeightIndexProps {

}

export const WeightIndex: React.FC<WeightIndexProps> = () => {

  return (
    <>
      <UserContainer title="" body={<WeightManagement/>}/>
    </>
  )
}