# Preprocessing

BTEQs are usually called from Shell Scripts.

Sometimes users took advantage of BASH or SH facilities to define environment variables such as:
`${DATABASE}` or `${TABLE}` or `${DATE1}` etc.

In some ocassions the migration tool can handle them,
but in some situations those environment variables just produce something that the conversion tool cannot parse.

In order to help in some of these scenarios the following scripts can be used.
> *NOTE:* this scripts depends on the dotenv module to read .evn files
> In order to run this script make sure to install it first
> `pip install python-dotenv`


A .env file or dotenv file is a simple text configuration file for controlling your environment constants.

## What do .env files look like?
.env files are line delimitated text files, meaning that each new line represents a single variable. By convention .env variable names are uppercase words separated by underscores. Variable names are followed directly by an '=' which, in turn is followed directly by the value.

The first script is preprocess.py and it is supposed to preprocess your files before migration.

## Usage:

```
python preprocess.py filename.bteq
```

you should have a `.env` file on the same folder

A `.env` file is just a text file like:

```
DATABASE=DB1
TABLE=mytable
DATE1='1976-1-1'
```

The script will "expand" those values so the migration tool can find valid SQL statements.

The modified file will be called: filename.bteq => `filename.preprocessed.bteq`

Once you have migrated that file you will have a new file called:

`filename.preprocessed_BTEQ.py`

you can then run:

```
python undo_preprocess.py filename_preprocessed_BTEQ.py
```

It will try to reverse the expansion, which is not perfect dependending on the level of transformation of the statements.

