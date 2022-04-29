private void find_design_date() {

        // on the Java version, the birthdate, used to calculate the design date, uses
        // global variables: year, month, day, hour, minute, second as the birthdate info
        // global variables: design_year, design_month etc. are the calculated result

        double[] x = new double[6];
        Double tjd_et = 0.0;
        int ipl = 0;
        int iflag = 258; // Int32 iflag = 258;
        long iflgret = 0;
        StringBuffer serr = new StringBuffer();
        double jut = 0;
        double tjd_ut = 0;
        String time_zone = userProfiles.TimeZone;
        double utc_adjust = 0;
        int gregflag = 1; // gregorian dates only for now
        int jhour, jmin, jsec;
        double delt;
        boolean gregflag_bool;
        Date design_date;

        String longdate = Integer.toString(year) + "/" + Integer.toString(month) + "/" + Integer.toString(day) + " " +
        Integer.toString(hour) + ":" + Integer.toString(minute) + ":" + Integer.toString(second);
        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        Calendar calDate = Calendar.getInstance();
        try {
        design_date = format.parse(longdate);
        calDate.setTime(design_date);
        } catch (Exception e) {
        }

        calDate.add(Calendar.HOUR, -86 * 24); // convert days to hours
        calDate.add(Calendar.MINUTE, non_hour_time_subtraction);
        if (time_zone.length() > 8) // convert to GMT universal time if needed
        if (time_zone.substring(4, 5).equals("-")
        || time_zone.substring(4, 5).equals("+")) {
        utc_adjust = Double.parseDouble(time_zone.substring(4, 7));
        calDate.add(Calendar.HOUR_OF_DAY, (int) utc_adjust * -1); // timezone +/- is opposite of what we needis
        }

        // 1st time - test special case where sun & x[0] at opposite ends
        // i.e. when cal sunvalue was < 0 and 360 was added to make positive
        boolean first_time_through = true;
        {
        do {
        // try_again:
        calDate.add(Calendar.HOUR, -1);
        jut = (double) calDate.get(Calendar.HOUR_OF_DAY)
        + (double) calDate.get(Calendar.MINUTE) / 60.0;
        // if (use_dll)
        try {
        // tjd_ut = sw.swe_julday(design_date.getYear(),
        // design_date.getMonthOfYear(),
        // design_date.getDayOfMonth(), jut, gregflag);
        sd.setDate(calDate.get(Calendar.YEAR),
        calDate.get(Calendar.MONTH)+1,
        calDate.get(Calendar.DAY_OF_MONTH), jut);
        gregflag_bool = false;
        if (gregflag != 0)
        gregflag_bool = true;
        sd.setCalendarType(gregflag_bool, SweDate.SE_KEEP_DATE); // Keep
        // Date!
        tjd_ut = sd.getJulDay();
        // tjd += thour / 24.0; // I'm not sure what this line is
        // for unless it is for ut, in which case it is already
        // accounted for- 2/26/14
        sd.setJulDay(tjd_ut);
        } catch (Exception ex) {
        //MessageBox xdialog = new MessageBox(shell, SWT.OK);
        //xdialog.setText("Error on swe_julday on find_design_date (1)");
        //xdialog.setMessage(ex.getMessage());
        //xdialog.open();
        }
        jut += 0.5 / 3600;
        jhour = (int) jut;
        jmin = (int) (jut * 60 % 60);
        jsec = (int) (jut * 3600 % 60);
        jut = jhour + jmin / 60.0 + jsec / 3600.0;
        delt = SweDate.getDeltaT(tjd_ut);
        tjd_et = tjd_ut + delt;
        // fixed (double* xptr = &x[0])
        {
        // byte* err = stackalloc byte[256];
        // if (use_dll)
        // {
        iflgret = sw.swe_calc(tjd_et, ipl, iflag, x, serr);
        // serr.setLength(0);
        // for (int j = 0; j < 256 && err[j] != '\0'; j++)
        // serr += Convert.ToString((char)err[j]);
        // error_string = serr;
        }
        if (first_time_through && sun_value - x[0] > 10) { // reevaluate
        // design
        // date and
        // try again
        calDate.add(Calendar.DAY_OF_MONTH, -1);
        // goto try_again;
        continue;
        }
        first_time_through = false;
        } while (x[0] > sun_value);

        // we now have the date and the hour, now find minute
        do {
        calDate.add(Calendar.MINUTE, 1);
        jut = calDate.get(Calendar.HOUR_OF_DAY)
        + calDate.get(Calendar.MINUTE) / 60.0;
        // if (use_dll)
        // tjd_ut = swe_julday(design_date.Year, design_date.Month,
        // design_date.Day, jut, gregflag);
        try {
        // tjd_ut = swe_julday(design_date.getYear(),
        // design_date.getMonthOfYear(),
        // design_date.getDayOfMonth(), jut, gregflag);
        sd.setDate(calDate.get(Calendar.YEAR),
        calDate.get(Calendar.MONTH)+1,
        calDate.get(Calendar.DAY_OF_MONTH), jut);
        gregflag_bool = false;
        if (gregflag != 0)
        gregflag_bool = true;
        sd.setCalendarType(gregflag_bool, SweDate.SE_KEEP_DATE); // Keep
        // Date!
        tjd_ut = sd.getJulDay();
        // tjd += thour / 24.0; // I'm not sure what this line is
        // for unless it is for ut, in which case it is already
        // accounted for- 2/26/14
        sd.setJulDay(tjd_ut);
        } catch (Exception ex) {
        // MessageBox.Show(exx.Message,
        // "Alternate method failed 1, returning invalid date");
        //MessageBox xdialog = new MessageBox(shell, SWT.OK);
        //xdialog.setText("Error on swe_julday on find_design_date (2)");
        //xdialog.setMessage(ex.getMessage());
        //xdialog.open();
        //DateTime return_date = null; // 12/31/9999
        //return_date.withDayOfMonth(31);
        //return_date.withMonthOfYear(12);
        //return_date.withYear(9999);
        design_year = 9999;
        design_month = 12;
        design_day = 31;
        return; // DateTime.MaxValue;
        }
        jut += 0.5 / 3600;
        jhour = (int) jut;
        jmin = (int) (jut * 60 % 60);
        jsec = (int) (jut * 3600 % 60);
        jut = jhour + jmin / 60.0 + jsec / 3600.0;
        delt = SweDate.getDeltaT(tjd_ut);
        tjd_et = tjd_ut + delt;
        // fixed (double* xptr = &x[0])
        {
        iflgret = sw.swe_calc(tjd_et, ipl, iflag, x, serr);
        // serr = "";
        // for (int j = 0; j < 256 && err[j] != '\0'; j++)
        // serr += Convert.ToString((char)err[j]);
        // error_string = serr;
        }
        } while (x[0] < sun_value);
        // we've gone over on minutes, so subtract 1
        calDate.add(Calendar.MINUTE, -1);
        // we now have the date, hour and minute, now find second
        // double x1;
        do {
        calDate.add(Calendar.SECOND, 1);;
        jut = (double) calDate.get(Calendar.HOUR_OF_DAY)
        + (double) (calDate.get(Calendar.MINUTE) / 60.0)
        + (double) (calDate.get(Calendar.SECOND) / 3600.0);
        // if (use_dll)
        try {
        // tjd_ut = swe_julday(design_date.getYear(),
        // design_date.getMonthOfYear(),
        // design_date.getDayOfMonth(), jut, gregflag);
        sd.setDate(calDate.get(Calendar.YEAR),
        calDate.get(Calendar.MONTH)+1,
        calDate.get(Calendar.DAY_OF_MONTH), jut);
        gregflag_bool = false;
        if (gregflag != 0)
        gregflag_bool = true;
        sd.setCalendarType(gregflag_bool, SweDate.SE_KEEP_DATE); // Keep
        // Date!
        tjd_ut = sd.getJulDay();
        // tjd += thour / 24.0; // I'm not sure what this line is
        // for unless it is for ut, in which case it is already
        // accounted for- 2/26/14
        sd.setJulDay(tjd_ut);
        } catch (Exception ex) {
        //MessageBox xdialog = new MessageBox(shell, SWT.OK);
        //xdialog.setText("Error on swe_julday on find_design_date (3)");
        //xdialog.setMessage(ex.getMessage());
        //xdialog.open();
        //DateTime return_date = null; // 12/31/9999
        //return_date.withDayOfMonth(31);
        //return_date.withMonthOfYear(12);
        //return_date.withYear(9999);
        design_year = 9999;
        design_month = 12;
        design_day = 31;
        return ; // DateTime.MaxValue;
        }
        jut += 0.5 / 3600;
        jhour = (int) jut;
        jmin = (int) (jut * 60 % 60);
        jsec = (int) (jut * 3600 % 60);
        jut = jhour + jmin / 60.0 + jsec / 3600.0;
        delt = SweDate.getDeltaT(tjd_ut);
        tjd_et = tjd_ut + delt;
        // fixed (double* xptr = &x[0])
        {
        // byte* err = stackalloc byte[256];
        // if (use_dll)
        // {
        iflgret = sw.swe_calc(tjd_et, ipl, iflag, x, serr);
        // serr = "";
        // for (int j = 0; j < 256 && err[j] != '\0'; j++)
        // serr += Convert.ToString((char)err[j]);
        // error_string = serr;
        // }
        // else
        // {
        // error_string = "";
        // iflgret = sweph.pth_swe_calc(tjd_et, ipl, iflag, xptr,
        // error_string);
        // serr = error_string;
        // }
        }
        // x1 = x[0];
        } while (x[0] < sun_value);
        // we've gone over on seconds, so subtract 1
        calDate.add(Calendar.SECOND, -1);

        // tenths of seconds. Let's go overboard on accuracy
        double seconds;
        do {
        calDate.add(Calendar.MILLISECOND, 100);;
        seconds = (double) calDate.get(Calendar.SECOND)
        + (double) calDate.get(Calendar.MILLISECOND) / 1000;
        jut = (double) calDate.get(Calendar.HOUR_OF_DAY)
        + (double) (calDate.get(Calendar.MINUTE) / 60.0)
        + (double) (seconds / 3600.0);
        // if (use_dll)
        try {
        // tjd_ut = swe_julday(design_date.getYear(),
        // design_date.getMonthOfYear(),
        // design_date.getDayOfMonth(), jut, gregflag);
        sd.setDate(calDate.get(Calendar.YEAR),
        calDate.get(Calendar.MONTH)+1,
        calDate.get(Calendar.DAY_OF_MONTH), jut);
        gregflag_bool = false;
        if (gregflag != 0)
        gregflag_bool = true;
        sd.setCalendarType(gregflag_bool, SweDate.SE_KEEP_DATE); // Keep
        // Date!
        tjd_ut = sd.getJulDay();
        // tjd += thour / 24.0; // I'm not sure what this line is
        // for unless it is for ut, in which case it is already
        // accounted for- 2/26/14
        sd.setJulDay(tjd_ut);
        } catch (Exception ex) {
        //MessageBox xdialog = new MessageBox(shell, SWT.OK);
        //xdialog.setText("Error on swe_julday on find_design_date (4)");
        //xdialog.setMessage(ex.getMessage());
        //xdialog.open();
        //DateTime return_date = null; // 12/31/9999
        //return_date.withDayOfMonth(31);
        //return_date.withMonthOfYear(12);
        //return_date.withYear(9999);
        design_year = 9999;
        design_month = 12;
        design_day = 31;
        return; // DateTime.MaxValue;
        }
        jut += 0.5 / 3600;
        jhour = (int) jut;
        jmin = (int) (jut * 60 % 60);
        jsec = (int) (jut * 3600 % 60);
        jut = jhour + jmin / 60.0 + jsec / 3600.0;
        delt = SweDate.getDeltaT(tjd_ut);
        tjd_et = tjd_ut + delt;
        // fixed (double* xptr = &x[0])
        {
        iflgret = sw.swe_calc(tjd_et, ipl, iflag, x, serr);
        // serr = "";
        // for (int j = 0; j < 256 && err[j] != '\0'; j++)
        // serr += Convert.ToString((char)err[j]);
        // error_string = serr;
        }
        // x1 = x[0];
        } while (x[0] < sun_value);
        // we've gone over on tenths of seconds, so subtract 100 milli
        calDate.add(Calendar.MILLISECOND, -100);;

        // hundredths of seconds
        do {
        calDate.add(Calendar.MILLISECOND, 10);;
        seconds = (double) calDate.get(Calendar.SECOND)
        + (double) calDate.get(Calendar.MILLISECOND) / 1000;
        jut = (double) calDate.get(Calendar.HOUR_OF_DAY)
        + (double) (calDate.get(Calendar.MINUTE) / 60.0)
        + (double) (seconds / 3600.0);
        // if (use_dll)
        try {
        // tjd_ut = swe_julday(design_date.getYear(),
        // design_date.getMonthOfYear(),
        // design_date.getDayOfMonth(), jut, gregflag);
        sd.setDate(calDate.get(Calendar.YEAR),
        calDate.get(Calendar.MONTH)+1,
        calDate.get(Calendar.DAY_OF_MONTH), jut);
        gregflag_bool = false;
        if (gregflag != 0)
        gregflag_bool = true;
        sd.setCalendarType(gregflag_bool, SweDate.SE_KEEP_DATE); // Keep
        // Date!
        tjd_ut = sd.getJulDay();
        // tjd += thour / 24.0; // I'm not sure what this line is
        // for unless it is for ut, in which case it is already
        // accounted for- 2/26/14
        sd.setJulDay(tjd_ut);
        } catch (Exception ex) {
        //MessageBox xdialog = new MessageBox(shell, SWT.OK);
        //xdialog.setText("Error on swe_julday on find_design_date (5)");
        //xdialog.setMessage(ex.getMessage());
        //xdialog.open();
        //DateTime return_date = null; // 12/31/9999
        //return_date.withDayOfMonth(31);
        //return_date.withMonthOfYear(12);
        //return_date.withYear(9999);
        design_year = 9999;
        design_month = 12;
        design_day = 31;
        return; // DateTime.MaxValue;
        }
        // else
        // tjd_ut = swedate.pth_swe_julday(design_date.Year,
        // design_date.Month, design_date.Day, jut, gregflag);
        jut += 0.5 / 3600;
        jhour = (int) jut;
        jmin = (int) (jut * 60 % 60);
        jsec = (int) (jut * 3600 % 60);
        jut = jhour + jmin / 60.0 + jsec / 3600.0;
        delt = SweDate.getDeltaT(tjd_ut);
        tjd_et = tjd_ut + delt;
        // fixed (double* xptr = &x[0])
        {
        // byte* err = stackalloc byte[256];
        // if (use_dll)
        // {
        iflgret = sw.swe_calc(tjd_et, ipl, iflag, x, serr);
        // serr = "";
        // for (int j = 0; j < 256 && err[j] != '\0'; j++)
        // serr += Convert.ToString((char)err[j]);
        // error_string = serr;
        // }
        // else
        // {
        // error_string = "";
        // iflgret = sweph.pth_swe_calc(tjd_et, ipl, iflag, xptr,
        // error_string);
        // serr = error_string;
        // }
        }
        // x1 = x[0];
        } while (x[0] < sun_value);
        // we've gone over on hundredths seconds, so subtract 10 milli
        calDate.add(Calendar.MILLISECOND, -10);;

        // thousands of seconds. Are we being anal yet?
        do {
        calDate.add(Calendar.MILLISECOND, 1);;
        seconds = (double) calDate.get(Calendar.SECOND)
        + (double) calDate.get(Calendar.MILLISECOND) / 1000;
        jut = (double) calDate.get(Calendar.HOUR_OF_DAY)
        + (double) (calDate.get(Calendar.MINUTE) / 60.0)
        + (double) (seconds / 3600.0);
        try {
        // tjd_ut = swe_julday(design_date.getYear(),
        // design_date.getMonthOfYear(),
        // design_date.getDayOfMonth(), jut, gregflag);
        sd.setDate(calDate.get(Calendar.YEAR),
        calDate.get(Calendar.MONTH)+1,
        calDate.get(Calendar.DAY_OF_MONTH), jut);
        gregflag_bool = false;
        if (gregflag != 0)
        gregflag_bool = true;
        sd.setCalendarType(gregflag_bool, SweDate.SE_KEEP_DATE); // Keep
        // Date!
        tjd_ut = sd.getJulDay();
        // tjd += thour / 24.0; // I'm not sure what this line is
        // for unless it is for ut, in which case it is already
        // accounted for- 2/26/14
        sd.setJulDay(tjd_ut);
        } catch (Exception ex) {
        //MessageBox xdialog = new MessageBox(shell, SWT.OK);
        //xdialog.setText("Error on swe_julday on find_design_date (6)");
        //xdialog.setMessage(ex.getMessage());
        //xdialog.open();
        //DateTime return_date = null; // 12/31/9999
        //return_date.withDayOfMonth(31);
        //return_date.withMonthOfYear(12);
        //return_date.withYear(9999);
        design_year = 9999;
        design_month = 12;
        design_day = 31;
        return ; // DateTime.MaxValue;

        }
        jut += 0.5 / 3600;
        jhour = (int) jut;
        jmin = (int) (jut * 60 % 60);
        jsec = (int) (jut * 3600 % 60);
        jut = jhour + jmin / 60.0 + jsec / 3600.0;
        delt = SweDate.getDeltaT(tjd_ut);
        tjd_et = tjd_ut + delt;
        // fixed (double* xptr = &x[0])
        {
        // byte* err = stackalloc byte[256];
        // if (use_dll)
        // {
        iflgret = sw.swe_calc(tjd_et, ipl, iflag, x, serr);
        // serr = "";
        // for (int j = 0; j < 256 && err[j] != '\0'; j++)
        // serr += Convert.ToString((char)err[j]);
        // error_string = serr;
        }
        // x1 = x[0];
        } while (x[0] < sun_value);
        // we've gone over on thousandths seconds, so subtract 1 milli
        calDate.add(Calendar.MILLISECOND, -1);;
        }

        design_year = calDate.get(Calendar.YEAR);
        design_month = calDate.get(Calendar.MONTH)+1;
        design_day = calDate.get(Calendar.DAY_OF_MONTH);
        design_hour = calDate.get(Calendar.HOUR_OF_DAY);
        design_minute = calDate.get(Calendar.MINUTE);
        design_second = calDate.get(Calendar.SECOND);

        userProfiles.DesignDate = calDate.getTime();
        }