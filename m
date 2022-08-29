From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 29 Aug 2022 18:15:36 +0200
Subject: [PATCH v5 3/7] KVM: selftests: Automatically do init_ucall() for
 non-barebones VMs
In-Reply-To: <20220825232522.3997340-4-seanjc@google.com>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-4-seanjc@google.com>
Message-ID: <20220829161536.gszp6yvgbzwnor7r@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 11:25:18PM +0000, Sean Christopherson wrote:
> Do init_ucall() automatically during VM creation to kill two (three?)
> birds with one stone.
> 
> First, initializing ucall immediately after VM creations allows forcing
> aarch64's MMIO ucall address to immediately follow memslot0.  This is
> still somewhat fragile as tests could clobber the MMIO address with a
> new memslot, but it's safe-ish since tests have to be conversative when
> accounting for memslot0.  And this can be hardened in the future by
> creating a read-only memslot for the MMIO page (KVM ARM exits with MMIO
> if the guest writes to a read-only memslot).  Add a TODO to document that
> selftests can and should use a memslot for the ucall MMIO (doing so
> requires yet more rework because tests assumes thay can use all memslots
> except memslot0).
> 
> Second, initializing ucall for all VMs prepares for making ucall
> initialization meaningful on all architectures.  aarch64 is currently the
> only arch that needs to do any setup, but that will change in the future
> by switching to a pool-based implementation (instead of the current
> stack-based approach).
> 
> Lastly, defining the ucall MMIO address from common code will simplify
> switching all architectures (except s390) to a common MMIO-based ucall
> implementation (if there's ever sufficient motivation to do so).
> 
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/aarch64/arch_timer.c        |  1 -
>  .../selftests/kvm/aarch64/debug-exceptions.c  |  1 -
>  .../selftests/kvm/aarch64/hypercalls.c        |  1 -
>  .../testing/selftests/kvm/aarch64/psci_test.c |  1 -
>  .../testing/selftests/kvm/aarch64/vgic_init.c |  2 -
>  .../testing/selftests/kvm/aarch64/vgic_irq.c  |  1 -
>  tools/testing/selftests/kvm/dirty_log_test.c  |  2 -
>  .../selftests/kvm/include/ucall_common.h      |  6 +--
>  .../selftests/kvm/kvm_page_table_test.c       |  1 -
>  .../testing/selftests/kvm/lib/aarch64/ucall.c | 54 ++-----------------
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 11 ++++
>  .../selftests/kvm/lib/perf_test_util.c        |  2 -
>  tools/testing/selftests/kvm/lib/riscv/ucall.c |  2 +-
>  tools/testing/selftests/kvm/lib/s390x/ucall.c |  2 +-
>  .../testing/selftests/kvm/lib/x86_64/ucall.c  |  2 +-
>  .../testing/selftests/kvm/memslot_perf_test.c |  1 -
>  tools/testing/selftests/kvm/rseq_test.c       |  1 -
>  tools/testing/selftests/kvm/steal_time.c      |  1 -
>  .../kvm/system_counter_offset_test.c          |  1 -
>  19 files changed, 20 insertions(+), 73 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

Thanks,
drew

