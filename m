From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 23 Mar 2023 15:50:14 +0800
Subject: [PATCH -next v15 13/19] riscv: signal: Add sigcontext save/restore for vector
In-Reply-To: <e0b5df49-4d78-4a0f-8509-ff29085486cf@spud>
References: <e0b5df49-4d78-4a0f-8509-ff29085486cf@spud>
Message-ID: <20230323075014.2135132-1-andy.chiu@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Mar 20, 2023 at 9:37???PM Conor Dooley <conor.dooley@microchip.com> wrote:
> Sparse, or at least Palmer's hacked up version of it that I am running
> [1] complains a bit about this patch, that you've added a few:
> + ?? ?? ??1 ../arch/riscv/kernel/signal.c:145:29: warning: incorrect type in initializer (different address spaces)
> + ?? ?? ??1 ../arch/riscv/kernel/signal.c:171:24: warning: incorrect type in initializer (different address spaces)
> + ?? ?? ??1 ../arch/riscv/kernel/signal.c:172:24: warning: incorrect type in initializer (different address spaces)
> + ?? ?? ??1 ../arch/riscv/kernel/signal.c:268:47: warning: incorrect type in initializer (different address spaces)
> + ?? ?? ??1 ../arch/riscv/kernel/signal.c:282:16: warning: incorrect type in initializer (different address spaces)
> + ?? ?? ??1 ../arch/riscv/kernel/signal.c:283:16: warning: incorrect type in initializer (different address spaces)
> Please have a look at those, and check whether they're valid complaints.

Yes, they are valid. Meanwhile, running sparse locally, I found the 
following, which are also reported at 19/19 patch:
arch/riscv/kernel/signal.c:78:13: warning: incorrect type in assignment (different address spaces) ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ?? ??
arch/riscv/kernel/signal.c:80:18: warning: cast removes address space '__user' of expression
arch/riscv/kernel/signal.c:92:16: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/signal.c:114:51: warning: incorrect type in initializer (different address spaces)

And these need to be fixed, while not found by your sparse:
arch/riscv/kernel/vector.c:81:28: warning: incorrect type in initializer (different address spaces)
arch/riscv/kernel/vector.c:81:28:    expected unsigned int [noderef] [usertype] __user *epc
arch/riscv/kernel/vector.c:81:28:    got unsigned int [usertype] *

However, there is no way to get around signal.c:92 though. The copying of
__user pointer to a __user address should be valid.

+static long save_v_state(struct pt_regs *regs, void **sc_vec)
+{
...
+	/* Copy the pointer datap itself. */
+	err |= __put_user(datap, &state->v_state.datap); 
...

>
> Otherwise, this version of this patch seems a lot nicer than the last
> version, so that makes me happy at least, even if sparse isn't..
>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>
> Cheers,
> Conor.

Thanks,
Andy

