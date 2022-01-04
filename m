From: Heiko Stübner <heiko@sntech.de>
Date: Tue, 04 Jan 2022 14:27:14 +0100
Subject: [PATCH v5 1/5] RISC-V: KVM: Mark the existing SBI implementation
 as v01
In-Reply-To: <6615284.qex3tTltCR@diego>
References: <20211118083912.981995-1-atishp@rivosinc.com>
 <20211118083912.981995-2-atishp@rivosinc.com> <6615284.qex3tTltCR@diego>
Message-ID: <8323751.1mJVJdxAKN@diego>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Am Dienstag, 4. Januar 2022, 14:19:41 CET schrieb Heiko St?bner:
> Hi Atish,
> 
> Am Donnerstag, 18. November 2021, 09:39:08 CET schrieb Atish Patra:
> > From: Atish Patra <atish.patra@wdc.com>
> > 
> > The existing SBI specification impelementation follows v0.1
> > specification. The latest specification allows more
> > scalability and performance improvements.
> > 
> > Rename the existing implementation as v01 and provide a way to allow
> > future extensions.
> > 
> > Reviewed-by: Anup Patel <anup.patel@wdc.com>
> > Signed-off-by: Atish Patra <atish.patra@wdc.com>
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> 
> > diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
> > index eb3c045edf11..32376906ff20 100644
> > --- a/arch/riscv/kvm/vcpu_sbi.c
> > +++ b/arch/riscv/kvm/vcpu_sbi.c
> > @@ -1,5 +1,5 @@
> >  // SPDX-License-Identifier: GPL-2.0
> > -/**
> > +/*
> >   * Copyright (c) 2019 Western Digital Corporation or its affiliates.
> >   *
> >   * Authors:
> 
> This got already fixed by [0]
> commit 0e2e64192100 ("riscv: kvm: fix non-kernel-doc comment block")
> so this patch doesn't apply cleanly anymore.

hmm, just found Anup's "I've queued this..." message after
writing my reply, so scratch the above ;-) .

@Anup: I've looked at git.kernel.org but didn't find a tree
there, can you tell me where this did go to?

Thanks
Heiko



