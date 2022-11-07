From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 13:22:03 -0500
Subject: [PATCH 09/44] KVM: Drop arch hardware (un)setup hooks
In-Reply-To: <20221102231911.3107438-10-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-10-seanjc@google.com>
Message-ID: <1166ac40ae848d81e7fa7aeec056c91079d768d4.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Drop kvm_arch_hardware_setup() and kvm_arch_hardware_unsetup() now
> that
> all implementations are nops.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?arch/arm64/include/asm/kvm_host.h?? |? 1 -
> ?arch/arm64/kvm/arm.c??????????????? |? 5 -----
> ?arch/mips/include/asm/kvm_host.h??? |? 1 -
> ?arch/mips/kvm/mips.c??????????????? |? 5 -----
> ?arch/powerpc/include/asm/kvm_host.h |? 1 -
> ?arch/powerpc/kvm/powerpc.c????????? |? 5 -----
> ?arch/riscv/include/asm/kvm_host.h?? |? 1 -
> ?arch/riscv/kvm/main.c?????????????? |? 5 -----
> ?arch/s390/kvm/kvm-s390.c??????????? | 10 ----------
> ?arch/x86/kvm/x86.c????????????????? | 10 ----------
> ?include/linux/kvm_host.h??????????? |? 2 --
> ?virt/kvm/kvm_main.c???????????????? |? 7 -------
> ?12 files changed, 53 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>	# s390
