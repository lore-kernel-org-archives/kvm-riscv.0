From: Adam Borowski <kilobyte@angband.pl>
Date: Mon, 22 Nov 2021 18:14:04 +0100
Subject: ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko] undefined!
Message-ID: <YZvP3AuTdEdje/IY@angband.pl>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!
With CONFIG_KVM=m and CONFIG_SMP=n, the build fails with:
ERROR: modpost: "boot_cpu_hartid" [arch/riscv/kvm/kvm.ko] undefined!

An obvious fix would be to change riscv_cpuid_to_hartid_mask() from a
static inline function to a real exported symbol, but I wonder: is there
a point in allowing such combinations that no one will test?


Meow.
-- 
??????? .--[ Makefile ]
??????? # beware of races
??????? all: pillage burn
??????? `----

