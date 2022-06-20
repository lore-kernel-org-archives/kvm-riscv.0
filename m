From: Andrew Jones <drjones@redhat.com>
Date: Mon, 20 Jun 2022 09:33:56 +0200
Subject: [PATCH 0/3] KVM: selftests: Consolidate ucall code
In-Reply-To: <20220618001618.1840806-1-seanjc@google.com>
References: <20220618001618.1840806-1-seanjc@google.com>
Message-ID: <20220620073356.fmtsa4ub74igm7me@gator>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jun 18, 2022 at 12:16:15AM +0000, Sean Christopherson wrote:
> Consolidate the code for making and getting ucalls.  All architectures pass
> the ucall struct via memory, so filling and copying the struct is 100%
> generic.  The only per-arch code is sending and receiving the address of
> said struct.
> 
> Tested on x86 and arm, compile tested on s390 and RISC-V.

For the series

Reviewed-by: Andrew Jones <drjones@redhat.com>

Thanks,
drew


