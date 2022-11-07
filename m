From: Eric Farman <farman@linux.ibm.com>
Date: Mon, 07 Nov 2022 14:08:47 -0500
Subject: [PATCH 30/44] KVM: Drop kvm_arch_check_processor_compat() hook
In-Reply-To: <20221102231911.3107438-31-seanjc@google.com>
References: <20221102231911.3107438-1-seanjc@google.com>
	 <20221102231911.3107438-31-seanjc@google.com>
Message-ID: <13c194d02d02a0e2adc006c724809b63c11f1e80.camel@linux.ibm.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, 2022-11-02 at 23:18 +0000, Sean Christopherson wrote:
> Drop kvm_arch_check_processor_compat() and its support code now that
> all
> architecture implementations are nops.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> ?arch/arm64/kvm/arm.c?????? |? 7 +------
> ?arch/mips/kvm/mips.c?????? |? 7 +------
> ?arch/powerpc/kvm/book3s.c? |? 2 +-
> ?arch/powerpc/kvm/e500.c??? |? 2 +-
> ?arch/powerpc/kvm/e500mc.c? |? 2 +-
> ?arch/powerpc/kvm/powerpc.c |? 5 -----
> ?arch/riscv/kvm/main.c????? |? 7 +------
> ?arch/s390/kvm/kvm-s390.c?? |? 7 +------
> ?arch/x86/kvm/svm/svm.c???? |? 4 ++--
> ?arch/x86/kvm/vmx/vmx.c???? |? 4 ++--
> ?arch/x86/kvm/x86.c???????? |? 5 -----
> ?include/linux/kvm_host.h?? |? 4 +---
> ?virt/kvm/kvm_main.c??????? | 24 +-----------------------
> ?13 files changed, 13 insertions(+), 67 deletions(-)

Reviewed-by: Eric Farman <farman@linux.ibm.com>	# s390

