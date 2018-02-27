$Conf{XferMethod} = 'tar';
$Conf{TarShareName} = [
  '/etc/BackupPC'
];
$Conf{TarClientCmd} = '/usr/bin/sudo $tarPath -c -v -f - -C $shareName+ --totals';
