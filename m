From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 12 Sep 2024 11:11:28 +0200
Subject: [PATCH v2 02/13] KVM: selftests: Return a value from
 vcpu_get_reg() instead of using an out-param
In-Reply-To: <20240911204158.2034295-3-seanjc@google.com>
References: <20240911204158.2034295-1-seanjc@google.com>
 <20240911204158.2034295-3-seanjc@google.com>
Message-ID: <20240912-a3894135370bf3fe551ed018@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 11, 2024 at 01:41:47PM GMT, Sean Christopherson wrote:
> Return a uint64_t from vcpu_get_reg() instead of having the caller provide
> a pointer to storage, as none of the KVM_GET_ONE_REG usage in KVM selftests

"none of the vcpu_get_reg() usage"

(There is KVM_GET_ONE_REG usage accessing larger registers, but those are
 done through __vcpu_get_reg(). See get-reg-list.c)

> accesses a register larger than 64 bits, and vcpu_set_reg() only accepts a
> 64-bit value.  If a use case comes along that needs to get a register that
> is larger than 64 bits, then a utility can be added to assert success and
> take a void pointer, but until then, forcing an out param yields ugly code
> and prevents feeding the output of vcpu_get_reg() into vcpu_set_reg().
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/aarch64/aarch32_id_regs.c   | 10 +--
>  .../selftests/kvm/aarch64/debug-exceptions.c  |  4 +-
>  .../selftests/kvm/aarch64/hypercalls.c        |  6 +-
>  .../testing/selftests/kvm/aarch64/psci_test.c |  6 +-
>  .../selftests/kvm/aarch64/set_id_regs.c       | 18 ++---
>  .../kvm/aarch64/vpmu_counter_access.c         | 19 +++---
>  .../testing/selftests/kvm/include/kvm_util.h  |  6 +-
>  .../selftests/kvm/lib/aarch64/processor.c     |  8 +--
>  .../selftests/kvm/lib/riscv/processor.c       | 66 +++++++++----------
>  .../testing/selftests/kvm/riscv/arch_timer.c  |  2 +-
>  .../testing/selftests/kvm/riscv/ebreak_test.c |  2 +-
>  .../selftests/kvm/riscv/sbi_pmu_test.c        |  2 +-
>  tools/testing/selftests/kvm/s390x/resets.c    |  2 +-
>  tools/testing/selftests/kvm/steal_time.c      |  3 +-
>  14 files changed, 77 insertions(+), 77 deletions(-)
>

Other than the commit message not being quite right,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

