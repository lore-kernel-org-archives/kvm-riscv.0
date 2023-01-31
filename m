From: Andy Chiu <andy.chiu@sifive.com>
Date: Tue, 31 Jan 2023 20:34:00 +0800
Subject: [PATCH -next v13 15/19] riscv: Fix a kernel panic issue if $s2 is
 set to a specific value before entering Linux
In-Reply-To: <Y9Q0h88UL0BRaF8d@spud>
References: <20230125142056.18356-1-andy.chiu@sifive.com> <20230125142056.18356-16-andy.chiu@sifive.com>
 <Y9Q0h88UL0BRaF8d@spud>
Message-ID: <CABgGipW5Ba7wc8K1QXY=aiT0xGMSiTo4LdhsxpNn7pr58jiekw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 28, 2023 at 4:31 AM Conor Dooley <conor@kernel.org> wrote:
> grepping for code that does this (with your series applied), you are
> the only one who is using PT_SIZE rather than PT_SIZE_ON_STACK:
Yes, you are right. It should be PT_SIZE_ON_STACK, which considers
alignment of the stack top. The task_pt_regs() counter parts, which is
the macro that operates on it, also aligns to STACK_ALIGN. So , we
should use PT_SIZE_ON_STACK instead of PT_SIZE here.
#define task_pt_regs(tsk)                                               \
        ((struct pt_regs *)(task_stack_page(tsk) + THREAD_SIZE          \
                            - ALIGN(sizeof(struct pt_regs), STACK_ALIGN)))

Thanks,
Andy

