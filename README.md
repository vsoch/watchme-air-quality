# Air Quality Watcher

This is an example watcher for an [Air Quality](http://aqicn.org/city/usa/north-carolina/durham-armory/), 
site, the idea being that we have a small list of locations that we want to watch,
and record values about air quality over time. You can use (and modify)
this particular example, or follow the instructions below to create it
from scratch.

### What is WatchMe?

WatchMe is a [tool for reproducible monitoring](https://vsoch.github.io/watchme).
This means that you can create one or more tasks to monitor web or system resources,
and collection version controlled results (git) at a regular interval (cron). 
For more details, see the [documentation base](https://vsoch.github.io/watchme)


## Clone

To clone this repository (and start with the watchers here), you can
first install watchme:

```bash
$ pip install watchme
```

and then get the repository:

```bash
              # repository                                     # watcher name
$ watchme get https://www.github.com/vsoch/watchme-air-quality air-quality
Added watcher watchme-air-quality
```

Conflrm that it was added:

```bash
$ watchme list
purpleair
air-quality
```

This will install the data to your $HOME/.watchme folder by default, unless
you've exported another `WATCHME_BASE_DIR`. Before you run the task, 
take a look at the data that has already been collected:

```bash
TODO
```

You can then run the task manually:

```bash
$ watchme run air-quality
```


But likely you want to activate and schedule the task to run.


### Schedule the Task

Instead of a manual run, you likely want to run the task and look for changes 
over time. You can do that like this:

```bash
$ watchme schedule air-quality @hourly
```

And then check that an entry has been added to crontab:

```bash
$ crontab -l
@hourly watchme run air-quality # watchme-air-quality
```

Finally, ensure that the watcher is active:

```bash
$ watchme activate air-quality
```

### Inspect task data

Finally, you likely want to inspect your data.

**under development**

### Limitations

Since this is an early example, it's intended to be simple. Each task folder
is allocated to a city. A more reasonable approach for a more popular resource
would be to define a task that takes a list of variables (of cities in this case)
and then saves the results in the same folder:

```bash
 task-air-quality/
     oakland.txt
     durham.txt
     pittsburgh.txt
```

I'm working on ways to do this (for example, allow for installation of custom
tasks without needing to define them in advance). We also could define lists
of variables in tasks folders, but I don't want to overcomplicate things.

## Creation

If you want to reproduce creating this watcher, it looks something like this:

Install Watchme

```bash
$ pip install watchme[urls-dynamic]
```

Initialize the base folder at $HOME/.watchme

```bash
$ watchme init
```

Create the air-quality watcher:

```bash
$ watchme create air-quality
```

And then install each of the tasks as follows:

```bash
$ watchme add task-air-oakland url@http://aqicn.org/city/california/alameda/oakland-west func@get_url_selection selection@#aqiwgtvalue file_name@oakland.txt get_text@true active@true type@urls

$ watchme add task-air-boulder url@http://aqicn.org/city/usa/colorado/boulder-cu/athens/ func@get_url_selection selection@#aqiwgtvalue file_name@boulder.txt get_text@true active@true type@urls

$ watchme add task-air-pittsburgh url@http://aqicn.org/city/usa/pennsylvania/allegheny/parkway-east/ func@get_url_selection selection@#aqiwgtvalue file_name@pittsburgh.txt get_text@true active@true type@urls

$ watchme add task-air-durham url@http://aqicn.org/city/usa/north-carolina/durham-armory/ func@get_url_selection selection@#aqiwgtvalue file_name@durham.txt get_text@true active@true type@urls
```

You can easily export a current configuration file (how I produced the commands
above).

```bash
$ watchme inspect air-quality --add-command
```
