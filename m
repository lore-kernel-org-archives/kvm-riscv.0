From: Andreas Schwab <schwab@suse.de>
Date: Thu, 09 Nov 2023 10:19:20 +0100
Subject: [6.6 regression] qemu-system-riscv64: Unable to read ISA_EXT KVM
 register ssaia, error -1
Message-ID: <mvmv8ab473b.fsf@suse.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v6.6 broke KVM with qemu 8.1.2.

$ qemu-system-riscv64 -cpu rv64 -machine virt,accel=kvm
qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1

openat(AT_FDCWD, "/dev/kvm", O_RDWR|O_CLOEXEC) = 9
ioctl(9, _IOC(_IOC_NONE, 0xae, 0x1, 0), 0) = 10
ioctl(10, _IOC(_IOC_NONE, 0xae, 0x41, 0), 0) = 11
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = 0
ioctl(11, _IOC(_IOC_WRITE, 0xae, 0xab, 0x10), 0x7fffd101e3f8) = -1 ENOENT (No such file or directory)
write(2, "qemu-system-riscv64:", 20qemu-system-riscv64:)    = 20
write(2, " ", 1 )                        = 1
write(2, "Unable to read ISA_EXT KVM regis"..., 51Unable to read ISA_EXT KVM register ssaia, error -1) = 51
write(2, "\n", 1
)                       = 1
close(11)                               = 0
close(10)                               = 0
close(9)                                = 0
exit_group(1)                           = ?
+++ exited with 1 +++

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

