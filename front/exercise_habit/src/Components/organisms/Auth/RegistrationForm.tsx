import React from 'react'
import { Link } from 'react-router-dom';
import { makeStyles, Theme, createStyles } from '@material-ui/core/styles';
import Card from '@material-ui/core/Card';
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import { useForm, SubmitHandler } from "react-hook-form";

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    root: {
      height: 700,
      textAlign: 'center',
      marginTop: 30,
    },

    title: {
      fontSize: 30,
      fontWeight: 'bold',
      paddingTop: 20,
    },

    authForm: {
      width: 300,
      marginTop: 20,
      textAlign: "center",
    },

    authButton: {
      fontSize: 16,
      width: 300,
      height: 50,
      marginTop: 20,
    },
    repletion: {
      color: "rgba(0, 0, 0, 0.54)",
    },

    errorMessage: {
      height: 10,
      color: "red",
      fontSize: 12,
    }
  }),
);

interface RegistrationFormProps {
  connectRegistrationApi: Function
  errorMessage: string
}

export const RegistrationForm: React.FC<RegistrationFormProps> = ({ connectRegistrationApi, errorMessage }) => {
  const classes = useStyles();

  type RegistrationData = {
    name: string;
    email: string;
    password: string;
    password_confirmation: string;
  }

  const { register, handleSubmit, formState: { errors }, reset } = useForm<RegistrationData>()

  const handleOnSubmit: SubmitHandler<RegistrationData> = (requestData: RegistrationData): void => {
    connectRegistrationApi(requestData)
  }

  return (
    <Card className={classes.root}>
      <Typography className={classes.title} color="textSecondary" gutterBottom>
        新規登録
      </Typography>
      <form className={classes.root} onSubmit={handleSubmit(handleOnSubmit)}>
        <span className={classes.errorMessage}>{errorMessage}</span><br/>
        <TextField className={classes.authForm} id="name" label="お名前" variant="outlined" type="text" {...register("name", { required: true, maxLength: 50 })}/><br/>
        <span className={classes.errorMessage}>
          {errors.name && errors.name.type === "required" && "お名前を入力してください"}
          {errors.name && errors.name.type === "maxLength" && "50文字以内で入力してください"}
        </span><br/>

        <TextField className={classes.authForm} id="email" label="メールアドレス" variant="outlined" type="email" {...register("email", { required: true,
          pattern: {
          value: /\S+@\S+\.\S+/,
          message: "メールアドレスの形式が違います" }})}/><br/>
        <span className={classes.errorMessage}>
          {errors.email && errors.email.type === "required" && "メールアドレスを入力してください"}
          {errors.email && errors.email.type === "pattern" && "メールアドレスの形式が違います"}
        </span><br/>

        <TextField className={classes.authForm} id="password" label="パスワード" variant="outlined" type="password" {...register("password", { required: true, minLength: 6 })}/><br/>
        <span className={classes.errorMessage}>
          {errors.password && errors.password.type === "required" && "パスワードを入力してください"}
          {errors.password && errors.password.type === "minLength" && "パスワードは6文字以上で入力してください"}
        </span><br/>

        <TextField className={classes.authForm} id="password_confirmation" label="パスワード(確認用)" variant="outlined" type="password" {...register("password_confirmation", { required: true, minLength: 6 })}/><br/>
        <span className={classes.errorMessage}>
          {errors.password_confirmation && errors.password_confirmation.type === "required" && "パスワード(確認用)を入力してください"}
          {errors.password_confirmation && errors.password_confirmation.type === "minLength" && "パスワード(確認用)は6文字以上で入力してください"}
        </span><br/>

        <Button className={classes.authButton} variant="contained" type="submit">登録</Button>

        <p className={classes.repletion}>すでにアカウントをお持ちの方は<Link to="/sign_in">こちら</Link></p>
      </form>
    </Card>
  );
}