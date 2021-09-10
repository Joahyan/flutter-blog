

import 'package:date_format/date_format.dart';

dateFormat(DateTime time,String? formatStr) {
  if (formatStr == null) {
    formatStr = 'yyyy-MM-dd HH:mm:ss';
  }
  return formatDate(time,[yy,'-',mm,'-',dd,' ',HH,':',nn,':',ss]);
}
