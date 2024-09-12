From: Sean Christopherson <seanjc@google.com>
Date: Thu, 12 Sep 2024 07:03:48 -0700
Subject: [PATCH v2 00/13] KVM: selftests: Morph max_guest_mem to mmu_stress
In-Reply-To: <20240912-757a952b867ea1136cb260cf@orel>
References: <20240911204158.2034295-1-seanjc@google.com> <20240912-757a952b867ea1136cb260cf@orel>
Message-ID: <ZuL0xEIB1ol5epEE@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024, Andrew Jones wrote:
> I gave this test a try on riscv, but it appears to hang in
> rendezvous_with_vcpus(). My platform is QEMU, so maybe I was just too
> impatient.

Try running with " -m 1 -s 1", which tells the test to use only 1GiB of memory.
That should run quite quickly, even in an emulator.

> Anyway, I haven't read the test yet, so I don't even know what it's doing.
> It's possibly it's trying to do something not yet supported on riscv. I'll
> add investigating that to my TODO, but I'm not sure when I'll get to it.
> 
> As for this series, another patch (or a sneaky change to one
> of the patches...) should add 
> 
>  #include "ucall_common.h"
> 
> to mmu_stress_test.c since it's not there yet despite using get_ucall().
> Building riscv faild because of that.

Roger that.

Thanks!

