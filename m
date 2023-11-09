From: Andreas Schwab <schwab@suse.de>
Date: Thu, 09 Nov 2023 10:37:09 +0100
Subject: [PATCH 1/6] RISC-V: KVM: return ENOENT in *_one_reg() when reg
 is unknown
In-Reply-To: <20230731120420.91007-2-dbarboza@ventanamicro.com> (Daniel
	Henrique Barboza's message of "Mon, 31 Jul 2023 09:04:15 -0300")
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
	<20230731120420.91007-2-dbarboza@ventanamicro.com>
Message-ID: <mvmr0kz469m.fsf@suse.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Jul 31 2023, Daniel Henrique Barboza wrote:

> Existing userspaces can be affected by this error code change. We
> checked a few. As of current upstream code, crosvm doesn't check for any
> particular errno code when using kvm_(get|set)_one_reg(). Neither does
> QEMU.

That may break qemu:

$ qemu-system-riscv64 -cpu rv64 -machine virt,accel=kvm      
qemu-system-riscv64: Unable to read ISA_EXT KVM register ssaia, error -1

-- 
Andreas Schwab, SUSE Labs, schwab at suse.de
GPG Key fingerprint = 0196 BAD8 1CE9 1970 F4BE  1748 E4D4 88E3 0EEA B9D7
"And now for something completely different."

