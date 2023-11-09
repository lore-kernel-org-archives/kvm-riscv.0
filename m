From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date: Thu, 9 Nov 2023 16:33:25 -0300
Subject: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg is
 unknown
In-Reply-To: <mvmr0kz469m.fsf@suse.de>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
 <20230731120420.91007-2-dbarboza@ventanamicro.com> <mvmr0kz469m.fsf@suse.de>
Message-ID: <5d60b71e-d470-449c-b23f-77ae0a6528bb@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 11/9/23 06:37, Andreas Schwab wrote:
> On Jul 31 2023, Daniel Henrique Barboza wrote:
> 
>> Existing userspaces can be affected by this error code change. We
>> checked a few. As of current upstream code, crosvm doesn't check for any
>> particular errno code when using kvm_(get|set)_one_reg(). Neither does
>> QEMU.
> 
> That may break qemu:
> 
> $ qemu-system-riscv64 -cpu rv64 -machine virt,accel=kvm
> qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1

Which QEMU version are you using? This is a problem that was fixed upstream by:


commit 608bdebb6075b757e5505f6bbc60c45a54a1390b
Author: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Date:   Tue Oct 3 10:21:48 2023 -0300

     target/riscv/kvm: support KVM_GET_REG_LIST


If you're getting this error with upstream QEMU let me know and I'll take a look
there.


Thanks,


Daniel


> 

