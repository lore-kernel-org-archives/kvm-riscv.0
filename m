From: Julia Lawall <julia.lawall@inria.fr>
Date: Wed, 16 Mar 2022 22:10:06 +0100 (CET)
Subject: question about arch/riscv/kvm/mmu.c
Message-ID: <alpine.DEB.2.22.394.2203162205550.3177@hadrien>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

The function kvm_riscv_stage2_map contains the code:

mmu_seq = kvm->mmu_notifier_seq;

I noticed that in every other place in the kernel where the
mmu_notifier_seq field is read, there is a read barrier after it.  Is
there some reason why it is not necessary here?

thanks,
julia

