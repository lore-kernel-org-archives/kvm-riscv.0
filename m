From: Will Deacon <will@kernel.org>
Date: Thu, 26 May 2022 10:17:35 +0100
Subject: [PATCH kvmtool v2] Fixes: 0febaae00bb6 ("Add asm/kernel.h for riscv")
In-Reply-To: <20220524180030.1848992-1-daolu@rivosinc.com>
References: <20220524180030.1848992-1-daolu@rivosinc.com>
Message-ID: <165355598165.3705180.69056897352417098.b4-ty@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 24 May 2022 11:00:30 -0700, Dao Lu wrote:
> Fixes the following compilation issue:
> 
> include/linux/kernel.h:5:10: fatal error: asm/kernel.h: No such file
> or directory
>     5 | #include "asm/kernel.h"
> 
> 
> [...]

Applied to kvmtool (master), thanks!

[1/1] Fixes: 0febaae00bb6 ("Add asm/kernel.h for riscv")
      https://git.kernel.org/will/kvmtool/c/b4531b2c4d3f

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

