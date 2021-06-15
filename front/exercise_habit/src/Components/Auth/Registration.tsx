import React from 'react'
import { useHistory } from 'react-router-dom';
import { makeStyles, Theme, createStyles } from '@material-ui/core/styles';
import Grid from '@material-ui/core/Grid';
import { RegistrationForm } from './RegistrationForm';
import { connectPost } from '../Api/ConnectApi';


const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    main: {
      paddingTop: 60,
      backgroundColor: '#F5F5F5',
    },
  }),
);

interface RegistrationProps {
  handleLogin: Function
}

export const Registration: React.FC<RegistrationProps> = ({ handleLogin }) => {
  const classes = useStyles();
  type RequestData = {
    name: string,
    email: string,
    password: string,
    password_confirmation: string,
  }

  const history = useHistory();

  const connectRegistrationApi = async (requestData: RequestData) => {
    const responseData = await connectPost("http://localhost:3000/api/v1/user/auth", requestData);

    if (!responseData.isSuccess) {
      // エラー処理
    }

    handleLogin(responseData.data.name, responseData.headers)

    // サインイン後の画面へ遷移
    history.push('/');
  }

  return (
    <div className={classes.main}>
      <Grid container alignItems="center" justify="center">
        <Grid item xs={8}>
          <RegistrationForm connectRegistrationApi={connectRegistrationApi}/>
        </Grid>
      </Grid>
    </div>
  );
}