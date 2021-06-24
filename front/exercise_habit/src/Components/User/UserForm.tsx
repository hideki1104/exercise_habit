import React from 'react'
import { useForm, SubmitHandler } from "react-hook-form";
import Grid from '@material-ui/core/Grid';
import { makeStyles, Theme, createStyles } from '@material-ui/core/styles';
import CardContent from '@material-ui/core/CardContent';
import Typography from '@material-ui/core/Typography';
import TextField from '@material-ui/core/TextField';
import Button from '@material-ui/core/Button';
import Radio, { RadioProps } from '@material-ui/core/Radio';
import RadioGroup from '@material-ui/core/RadioGroup';
import FormControl from '@material-ui/core/FormControl';
import FormLabel from '@material-ui/core/FormLabel';
import clsx from 'clsx';

const useStyles = makeStyles((theme: Theme) =>
  createStyles({
    title: {
      fontSize: 30,
      fontWeight: 'bold',
      paddingTop: 30,
    },

    userForm: {
      width: 300,
      marginTop: 30,
    },

    registrationButton: {
      fontSize: 16,
      width: 300,
      height: 50,
      marginTop: 30,
    },

    repletion: {
      color: "rgba(0, 0, 0, 0.54)",
    },

    errorMessage: {
      height: 10,
      color: "red",
      fontSize: 12,
    },
    radio: {
      '&:hover': {
        backgroundColor: 'transparent',
      },
    },

    formTitile: {
      textAlign: "left",
    },

    icon: {
      borderRadius: '3%',
      fontSize: 16,
      width: 130,
      paddingTop: 10,
      paddingBottom: 10,
      boxShadow: 'inset 0 0 0 1px rgba(16,22,26,.2), inset 0 -1px 0 rgba(16,22,26,.1)',
      'input:hover ~ &': {
        backgroundColor: '#A9A9A9',
        color: "#ffffff",
      },
    },
    checkedIcon: {
      backgroundColor: '#A9A9A9',
      color: "#ffffff",
      '&:before': {
        display: 'block',
        content: '""',
      },
      'input:hover ~ &': {
        backgroundColor: '#A9A9A9',
        color: "#ffffff",
      },
    },
    birthdayField: {
      marginLeft: theme.spacing(1),
      marginRight: theme.spacing(1),
      width: 200,
    },
  }),
);

interface UserFormProps {
}

export const UserForm: React.FC<UserFormProps> = () => {
  type UserData = {
    height: number
    weight: number
    birthday: string
    sex: number
    training_type: number|null
  }

  const { register, handleSubmit, formState: { errors }, reset } = useForm<UserData>()
  const classes = useStyles();

  const handleOnSubmit: SubmitHandler<UserData> = (requestData: UserData): void => {
    console.log(requestData);
  }

  return (
    <>
      <Typography className={classes.title} color="textSecondary" gutterBottom>
        ユーザー情報登録
      </Typography>
      <CardContent>
        <form onSubmit={handleSubmit(handleOnSubmit)}>
          <TextField className={classes.userForm} id="height" label="身長" variant="outlined" type="text" {...register("height")}/><br/>
          <span className={classes.errorMessage}>
          </span><br/>

          <TextField className={classes.userForm} id="height" label="体重" variant="outlined" type="text" {...register("weight")}/><br/>
          <span className={classes.errorMessage}>
          </span><br/>

          <FormControl component="fieldset" className={classes.userForm}>
          <FormLabel className={classes.formTitile}>性別</FormLabel>
            <RadioGroup defaultValue="0" aria-label="sex" {...register("sex")}>
              <Grid container>
                <Grid item>
                <Radio
                  className={classes.radio}
                  disableRipple
                  color="default"
                  checkedIcon={<span className={clsx(classes.icon, classes.checkedIcon)}>男性</span>}
                  icon={<span className={classes.icon}>男性</span>}
                  value="0"
                />
                </Grid>
                <Grid item>
                <Radio
                  className={classes.radio}
                  disableRipple
                  color="default"
                  checkedIcon={<span className={clsx(classes.icon, classes.checkedIcon)}>女性</span>}
                  icon={<span className={classes.icon}>女性</span>}
                  value="1"
                />
                </Grid>
              </Grid>
            </RadioGroup>
          </FormControl><br/>

          <FormControl component="fieldset" className={classes.userForm}>
            <FormLabel className={classes.formTitile}>生年月日</FormLabel>
            <TextField
              id="date"
              type="date"
              defaultValue="1990-01-01"
              InputLabelProps={{
                shrink: true,
              }}
              {...register("birthday")}
            />
          </FormControl><br/>

          <Button className={classes.registrationButton} id="login_button" variant="contained" type="submit">次へ進む</Button><br/>
        </form>
      </CardContent>
    </>
  );
}