From: Pavel Machek <pavel@ucw.cz>
Date: Sat, 12 Feb 2022 12:43:55 +0100
Subject: [PATCH v11 1/8] RISC-V: Enable CPU_IDLE drivers
In-Reply-To: <20220210054947.170134-2-apatel@ventanamicro.com>
References: <20220210054947.170134-1-apatel@ventanamicro.com>
 <20220210054947.170134-2-apatel@ventanamicro.com>
Message-ID: <20220212114355.GF20866@duo.ucw.cz>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

> From: Anup Patel <anup.patel@wdc.com>
> 
> We force select CPU_PM and provide asm/cpuidle.h so that we can
> use CPU IDLE drivers for Linux RISC-V kernel.
> 
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> Signed-off-by: Anup Patel <apatel@vetanamicro.com>

This is quite... interesting. Normally we have one signoff per
person...

Best regards,
							Pavel
-- 
http://www.livejournal.com/~pavelmachek
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20220212/9905deae/attachment.sig>
