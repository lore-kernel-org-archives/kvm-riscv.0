From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Mon, 13 Nov 2023 07:27:32 -0300
Subject: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg is
 unknown
In-Reply-To: <mvmfs1a3vjl.fsf@suse.de>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
 <20230731120420.91007-2-dbarboza@ventanamicro.com> <mvmr0kz469m.fsf@suse.de>
 <5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com>
 <mvmfs1a3vjl.fsf@suse.de>
Message-ID: <6d8ff85e-b0b6-46f2-8554-b9543f3eab31@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/13/23 05:30, Andreas Schwab wrote:
> On Nov 09 2023, Daniel Henrique Barboza wrote:
> 
>> Which QEMU version are you using?
> 
> The very latest release, both host and guest.

If by "latest release" you mean kernel 6.6 and QEMU 8.1, this combination is
broken ATM.

Back in 8.1 QEMU was checking for EINVAL to make an educated guess of whether an
extension was unavailable but the register exists, versus if the register was alien
to KVM at all (qemu commit f7a69fa6e6). This turned out to be a mistake because
EINVAL was being thrown for all sorts of errors, and QEMU would be wiser to just
error out in all errors like other VMMs were doing (including kvmtool).

These were considerations made when proposing this KVM side change in the cover letter.
Other VMMs would be unaffected by it, and QEMU would need changes to adapt to the new
error codes. QEMU 8.2 is already adapted. It's not ideal, but it's better to take
a hit now while the RISC-V ecosystem is still new and make things tidy for the
future.

And now that I'm thinking more about it, I'll push a QEMU change in 8.1-stable to
alleviate the issue for 8.1. My apologies, I should've thought about it earlier ...


Thanks,

Daniel


> 

