$Conf{ClientNameAlias} = 'localhost';
$Conf{XferMethod} = 'tar';
$Conf{TarShareName} = [
  '/etc/BackupPC'
];
$Conf{TarClientCmd} = '/usr/bin/sudo $tarPath -c -v -f - -C $shareName+ --totals';
$Conf{TarClientRestoreCmd} = '/usr/bin/sudo $tarPath -x -p --numeric-owner --same-owner -v -f - -C $shareName+';
